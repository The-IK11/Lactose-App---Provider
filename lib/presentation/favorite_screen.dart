import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lactos_app_with_provider/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Favourites',
          style: GoogleFonts.leckerliOne(
            fontSize: 24.sp,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Icon(
              Icons.favorite_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 22.sp,
            ),
          ),
        ],
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) {
          final items = favoriteProvider.items;

          if (items.isEmpty) {
            return _EmptyState();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Text(
                  '${items.length} saved items',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
                    letterSpacing: 0.4,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _FavouriteCard(item: item);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _FavouriteCard extends StatelessWidget {
  final FavoriteItem item;

  const _FavouriteCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => context.read<FavoriteProvider>().removeItem(item.id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
          color: colorScheme.error.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(
          Icons.delete_outline_rounded,
          color: colorScheme.error,
          size: 22.sp,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withOpacity(0.45),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: colorScheme.outlineVariant.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                item.icon,
                color: colorScheme.primary,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 14.w),
            // Title & subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    item.subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      color: colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            // Favourite icon
            Icon(
              Icons.favorite_rounded,
              color: colorScheme.primary.withOpacity(0.7),
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.favorite_border_rounded,
            size: 56.sp,
            color: colorScheme.onSurface.withOpacity(0.2),
          ),
          SizedBox(height: 16.h),
          Text(
            'No favourites yet',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface.withOpacity(0.4),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Items you save will appear here',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: colorScheme.onSurface.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}
