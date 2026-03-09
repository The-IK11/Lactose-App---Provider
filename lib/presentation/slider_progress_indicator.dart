import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

 double _sliderValue = 0.5; // Initial slider value


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.greenAccent,
        title:  Text('Slider Progress Indicator'),
        titleTextStyle: GoogleFonts.laila(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                
                trackGap: 0.2,
                value: _sliderValue, // Set the progress value (0.0 to 1.0)
                strokeWidth: 10,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
              ),
            ),
              const SizedBox(height: 40),
            const Text('Slider Progress Indicator'),
            const SizedBox(height: 20),
            Slider(
              thumbColor: Colors.greenAccent,
              activeColor: Colors.greenAccent,
              value: _sliderValue,
              onChanged: (value) {
              _sliderValue=value;
              setState(() {
                
              });
                // Handle slider value change
              },
            ),
          ],
        ),
      ),
    );
  }
}