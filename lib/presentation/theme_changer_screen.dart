import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeChangerScreen extends StatelessWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme',
          style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: colorScheme.onSurface,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose app appearance',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
            SizedBox(height: 12.h),

            // Theme option cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ThemeOptionCard(
                  title: 'Light',
                  icon: Icons.wb_sunny_rounded,
                  subtitle: 'Bright and clean',
                ),
                _ThemeOptionCard(
                  title: 'Dark',
                  icon: Icons.nights_stay_rounded,
                  subtitle: 'Easy on the eyes',
                ),
                _ThemeOptionCard(
                  title: 'System',
                  icon: Icons.smartphone_rounded,
                  subtitle: 'Follow device',
                ),
              ],
            ),

            SizedBox(height: 20.h),

            Text(
              'Accent color',
              style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h),

            // Color swatches
            Row(
              children: [
                _ColorSwatch(color: Colors.deepPurple),
                SizedBox(width: 10.w),
                _ColorSwatch(color: Colors.teal),
                SizedBox(width: 10.w),
                _ColorSwatch(color: Colors.amber),
                SizedBox(width: 10.w),
                _ColorSwatch(color: Colors.pink),
                SizedBox(width: 10.w),
                _ColorSwatch(color: Colors.blue),
              ],
            ),

            SizedBox(height: 22.h),

            Text(
              'Preview',
              style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h),

            // Preview card
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: colorScheme.surfaceVariant,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 12.w),
                          Icon(Icons.menu_rounded, color: colorScheme.primary),
                          SizedBox(width: 12.w),
                          Text('App title', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      'This is a preview of the selected theme and accent color. Sample text, buttons and cards will follow the chosen settings.',
                      style: GoogleFonts.poppins(fontSize: 12.sp, color: colorScheme.onSurface.withOpacity(0.8)),
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      children: [
                        ElevatedButton(onPressed: null, child: Text('Primary')),
                        SizedBox(width: 10.w),
                        OutlinedButton(onPressed: null, child: Text('Secondary')),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        children: List.generate(
                          4,
                          (index) => Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: colorScheme.outline.withOpacity(0.12)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.label_rounded, size: 18.sp, color: colorScheme.primary),
                                SizedBox(height: 8.h),
                                Text('Card title', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                                SizedBox(height: 6.h),
                                Text('Subtitle', style: GoogleFonts.poppins(fontSize: 11.sp, color: colorScheme.onSurface.withOpacity(0.6))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 12.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                child: Text('Save appearance', style: GoogleFonts.poppins(fontSize: 14.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _ThemeOptionCard({required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: colorScheme.outline.withOpacity(0.08)),
          boxShadow: [
            BoxShadow(color: colorScheme.shadow.withOpacity(0.03), blurRadius: 6, offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: colorScheme.primary, size: 22.sp),
            SizedBox(height: 8.h),
            Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            SizedBox(height: 4.h),
            Text(subtitle, style: GoogleFonts.poppins(fontSize: 11.sp, color: colorScheme.onSurface.withOpacity(0.6))),
          ],
        ),
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  final Color color;

  const _ColorSwatch({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: Colors.black12),
      ),
    );
  }
}