import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lactos_app_with_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeChangerScreen extends StatelessWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: colorScheme.onSurface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Appearance', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),

            // Consumer widget for reactive theme selection
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.wb_sunny_rounded),
                        title: const Text('Light'),
                        subtitle: const Text('Bright and clean'),
                        trailing: Radio<ThemeMode>(
                          value: ThemeMode.light,
                          groupValue: themeProvider.themeMode,
                          onChanged: (value) {
                            if (value != null) {
                              themeProvider.toggleTheme(value);
                            }
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.nights_stay_rounded),
                        title: const Text('Dark'),
                        subtitle: const Text('Easy on the eyes'),
                        trailing: Radio<ThemeMode>(
                          value: ThemeMode.dark,
                          groupValue: themeProvider.themeMode,
                          onChanged: (value) {
                            if (value != null) {
                              themeProvider.toggleTheme(value);
                            }
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.smartphone_rounded),
                        title: const Text('System'),
                        subtitle: const Text('Follow device settings'),
                        trailing: Radio<ThemeMode>(
                          value: ThemeMode.system,
                          groupValue: themeProvider.themeMode,
                          onChanged: (value) {
                            if (value != null) {
                              themeProvider.toggleTheme(value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 18),
            Text('Accent color', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),

            // Simple color swatches
            Row(
              children: [
                _SimpleSwatch(color: Colors.deepPurple),
                const SizedBox(width: 10),
                _SimpleSwatch(color: Colors.teal),
                const SizedBox(width: 10),
                _SimpleSwatch(color: Colors.amber),
                const SizedBox(width: 10),
                _SimpleSwatch(color: Colors.pink),
              ],
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: null, child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }

}

class _SimpleSwatch extends StatelessWidget {
  final Color color;

  const _SimpleSwatch({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle, border: Border.all(color: Colors.black12)),
    );
  }
}