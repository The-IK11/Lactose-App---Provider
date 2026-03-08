import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lactos_app_with_provider/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class TimerCounterScreen extends StatefulWidget {
  const TimerCounterScreen({super.key});

  @override
  State<TimerCounterScreen> createState() => _TimerCounterScreenState();
}

class _TimerCounterScreenState extends State<TimerCounterScreen> {
 
   @override
   void initState() {
    super.initState();
    
    Timer.periodic(Duration(seconds: 1), (timer){
      context.read<CounterProvider>().incrementCouneter();
    });
  }

  @override
  Widget build(BuildContext context) {
    log("CounterScreen build method called");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        titleTextStyle: GoogleFonts.leckerliOne(
          fontSize: 24.sp,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Consumer<CounterProvider>(
              builder: (context, counterProvider, child) {
                log("Consumer builder called");
                return Text(
                  counterProvider.counter.toString(),
                  style: GoogleFonts.leckerliOne(
                    fontSize: 48.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterProvider>().incrementCouneter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}