import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lactos_app_with_provider/presentation/widgets/empty_favorite_placeholder.dart';
import 'package:lactos_app_with_provider/presentation/widgets/favorite_card.dart';
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
            return EmptyState();
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
                    return FavouriteCard(item: item);
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
