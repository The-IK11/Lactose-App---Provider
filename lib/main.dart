import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lactos_app_with_provider/presentation/counter_screen.dart';
import 'package:lactos_app_with_provider/presentation/favorite_screen.dart';
import 'package:lactos_app_with_provider/presentation/slider_progress_indicator.dart';
import 'package:lactos_app_with_provider/presentation/theme_changer_screen.dart';
import 'package:lactos_app_with_provider/provider/counter_provider.dart';
import 'package:lactos_app_with_provider/provider/favorite_provider.dart';
import 'package:lactos_app_with_provider/provider/slider_provider.dart';
import 'package:lactos_app_with_provider/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return  MultiProvider(
       
          providers: [
            ChangeNotifierProvider(create: (_) => CounterProvider()),
            ChangeNotifierProvider(create: (_) => SliderProvider()),
            ChangeNotifierProvider(create: (_) => FavoriteProvider()),
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ],
          child: Builder(
            builder: (BuildContext context) {

              final themeProvider = Provider.of<ThemeProvider>(context);
      return     MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Lactos App with Provider',
                  themeMode: themeProvider.themeMode,
                  darkTheme: ThemeData(
                    brightness: Brightness.dark,
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.deepPurple,
                      outline: Colors.red,
                      brightness: Brightness.dark,
                    ),
                  ),
                  theme: ThemeData(
                    brightness: Brightness.light,
                    colorScheme: ColorScheme.fromSeed(
                      outline: Colors. yellow,
                      seedColor: Colors.deepPurple,
                      brightness: Brightness.light,
                    ),
                  ),
                  home: const ThemeChangerScreen(),
                );}
          ),
        );});
  }
}
