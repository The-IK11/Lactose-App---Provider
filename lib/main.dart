import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lactos_app_with_provider/presentation/counter_screen.dart';
import 'package:lactos_app_with_provider/presentation/favorite_screen.dart';
import 'package:lactos_app_with_provider/presentation/slider_progress_indicator.dart';
import 'package:lactos_app_with_provider/provider/counter_provider.dart';
import 'package:lactos_app_with_provider/provider/favorite_provider.dart';
import 'package:lactos_app_with_provider/provider/slider_provider.dart';
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
          ],
          child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Lactos App with Provider',
                theme: ThemeData(
                 
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
                ),
                home: const FavoriteScreen(),
              ),
        );});
  }
}
