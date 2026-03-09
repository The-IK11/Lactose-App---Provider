

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyState extends StatelessWidget {
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
