import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lactos_app_with_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeChangerScreen extends StatelessWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Theme Settings',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        backgroundColor: colorScheme.surfaceContainerHighest,
        elevation: 2,
        foregroundColor: colorScheme.onSurface,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Choose Your Appearance',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Customize how your app looks',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 24),
             Container(
                height: 100,
                width: double.infinity,
                color: Theme.of(  context).colorScheme.outline
              ),
              // Theme options with Consumer
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Card(
                    elevation: 2,
                    color: colorScheme.surfaceContainerHighest,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.wb_sunny_rounded,
                              color: colorScheme.primary,
                            ),
                          ),
                          title: Text(
                            'Light',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                          subtitle: const Text('Bright and clean'),
                          trailing: Radio<ThemeMode>(
                            value: ThemeMode.light,
                            groupValue: themeProvider.themeMode,
                            onChanged: (value) {
                              if (value != null) themeProvider.toggleTheme(value);
                            },
                          ),
                        ),
                        Divider(color: colorScheme.outlineVariant.withOpacity(0.3), height: 1),
                        ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.secondary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.nights_stay_rounded,
                              color: colorScheme.secondary,
                            ),
                          ),
                          title: Text(
                            'Dark',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                          subtitle: const Text('Easy on the eyes'),
                          trailing: Radio<ThemeMode>(
                            value: ThemeMode.dark,
                            groupValue: themeProvider.themeMode,
                            onChanged: (value) {
                              if (value != null) themeProvider.toggleTheme(value);
                            },
                          ),
                        ),
                        Divider(color: colorScheme.outlineVariant.withOpacity(0.3), height: 1),
                        ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.tertiary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.smartphone_rounded,
                              color: colorScheme.tertiary,
                            ),
                          ),
                          title: Text(
                            'System',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                          subtitle: const Text('Follow device settings'),
                          trailing: Radio<ThemeMode>(
                            value: ThemeMode.system,
                            groupValue: themeProvider.themeMode,
                            onChanged: (value) {
                              if (value != null) themeProvider.toggleTheme(value);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 28),

              // Accent color section with theme-specific colors
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Accent Color for ${themeProvider.themeMode == ThemeMode.light ? 'Light' : themeProvider.themeMode == ThemeMode.dark ? 'Dark' : 'System'} Mode',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Color swatches - interactive selection
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _SelectableColorSwatch(
                            color: Colors.deepPurple,
                            label: 'Purple',
                            isSelected: themeProvider.selectedColor == Colors.deepPurple,
                            onTap: () {
                              if (themeProvider.themeMode == ThemeMode.light) {
                                themeProvider.setLightModeColor(Colors.deepPurple);
                              } else if (themeProvider.themeMode == ThemeMode.dark) {
                                themeProvider.setDarkModeColor(Colors.deepPurple);
                              } else {
                                themeProvider.setSystemModeColor(Colors.deepPurple);
                              }
                            },
                          ),
                          _SelectableColorSwatch(
                            color: Colors.teal,
                            label: 'Teal',
                            isSelected: themeProvider.selectedColor == Colors.teal,
                            onTap: () {
                              if (themeProvider.themeMode == ThemeMode.light) {
                                themeProvider.setLightModeColor(Colors.teal);
                              } else if (themeProvider.themeMode == ThemeMode.dark) {
                                themeProvider.setDarkModeColor(Colors.teal);
                              } else {
                                themeProvider.setSystemModeColor(Colors.teal);
                              }
                            },
                          ),
                          _SelectableColorSwatch(
                            color: Colors.amber,
                            label: 'Amber',
                            isSelected: themeProvider.selectedColor == Colors.amber,
                            onTap: () {
                              if (themeProvider.themeMode == ThemeMode.light) {
                                themeProvider.setLightModeColor(Colors.amber);
                              } else if (themeProvider.themeMode == ThemeMode.dark) {
                                themeProvider.setDarkModeColor(Colors.amber);
                              } else {
                                themeProvider.setSystemModeColor(Colors.amber);
                              }
                            },
                          ),
                          _SelectableColorSwatch(
                            color: Colors.pink,
                            label: 'Pink',
                            isSelected: themeProvider.selectedColor == Colors.pink,
                            onTap: () {
                              if (themeProvider.themeMode == ThemeMode.light) {
                                themeProvider.setLightModeColor(Colors.pink);
                              } else if (themeProvider.themeMode == ThemeMode.dark) {
                                themeProvider.setDarkModeColor(Colors.pink);
                              } else {
                                themeProvider.setSystemModeColor(Colors.pink);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 28),

              // Live preview section
              Text(
                'Live Preview',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),

              // Preview cards
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sample button
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorScheme.primary,
                          ),
                          child: Text(
                            'Primary Button',
                            style: GoogleFonts.poppins(color: colorScheme.onPrimary),
                          ),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'Secondary',
                            style: GoogleFonts.poppins(color: colorScheme.onSurface),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Sample card
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: colorScheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(Icons.favorite, color: colorScheme.primary, size: 20),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sample Card',
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'This adapts to your theme',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: colorScheme.onSurface.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'The app is now ${isDark ? 'Dark' : 'Light'} themed',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: colorScheme.onSurface.withOpacity(0.5),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Theme saved!',
                          style: GoogleFonts.poppins(),
                        ),
                        backgroundColor: colorScheme.primary,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: colorScheme.primary,
                  ),
                  child: Text(
                    'Save Appearance',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectableColorSwatch extends StatelessWidget {
  final Color color;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SelectableColorSwatch({
    required this.color,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? color : colorScheme.outlineVariant.withOpacity(0.3),
              width: isSelected ? 3 : 1,
            ),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: color.withOpacity(0.3), blurRadius: 8)],
                    ),
                  ),
                  if (isSelected)
                    const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 20,
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}