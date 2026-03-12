import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lactos_app_with_provider/presentation/widgets/empty_favorite_placeholder.dart';
import 'package:lactos_app_with_provider/presentation/widgets/favorite_card.dart';
import 'package:lactos_app_with_provider/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
     
     floatingActionButton: FloatingActionButton(onPressed: () => showAddFavoriteDialog(context), child: const Icon(Icons.add),
     shape: CircleBorder(),),
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

 Future<dynamic> showAddFavoriteDialog(BuildContext context) {
   // We'll maintain the dialog-local state (selected category + name)
   return showDialog(context: context, builder: (context) {
     String? selectedCategory;
     String? itemName;

     // mapping for labels shown in the dialog
     final Map<String, String> categoryLabels = {
       'cat1': 'Health & Fitness',
       'cat2': 'Development',
       'cat3': 'Music',
       'cat4': 'Lifestyle',
       'cat5': 'Reading',
     };

     return StatefulBuilder(
       builder: (context, setDialogState) {
         return AlertDialog(
           title: const Text('Add to favorites'),
           content: Column(
             mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               TextField(
                 onChanged: (v) => itemName = v,
                 decoration: InputDecoration(
                   hintText: 'Enter item name',
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(12.r),
                   ),
                 ),
               ),
               SizedBox(height: 12.h),
               Align(
                 alignment: Alignment.centerLeft,
                 child: PopupMenuButton<String>(
                   itemBuilder: (context) => [
                     const PopupMenuItem(value: 'cat1', child: Text('Health & Fitness')),
                     const PopupMenuItem(value: 'cat2', child: Text('Development')),
                     const PopupMenuItem(value: 'cat3', child: Text('Music')),
                     const PopupMenuItem(value: 'cat4', child: Text('Lifestyle')),
                     const PopupMenuItem(value: 'cat5', child: Text('Reading')),
                   ],
                   color: Colors.blueGrey[50],
                   onSelected: (value) {
                     // use the dialog-local setState to update the UI inside the dialog
                     setDialogState(() {
                       selectedCategory = value;
                     });
                   },
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Text(
                         selectedCategory == null
                             ? 'Select category'
                             : (categoryLabels[selectedCategory] ?? 'Select category'),
                         style: GoogleFonts.poppins(fontSize: 14.sp),
                       ),
                       const Icon(Icons.arrow_drop_down_rounded),
                     ],
                   ),
                 ),
               ),
             ],
           ),
           actions: [
             TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
             ElevatedButton(
               onPressed: () {
                 // Return the entered values to the caller; do not alter provider here per request
                 Navigator.pop(context, {'name': itemName, 'category': selectedCategory});
               },
               child: const Text('Add'),
             ),
           ],
         );
       },
     );
   });
 }
}
