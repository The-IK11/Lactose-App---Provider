
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});



  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
         title: Text('Counter Screen'),
         titleTextStyle: GoogleFonts.leckerliOne(
        fontSize: 24.sp
         ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Center(

        child: Column(
       
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: GoogleFonts.leckerliOne(
                fontSize: 48.sp,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
