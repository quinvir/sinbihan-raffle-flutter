import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';

class NumberDisplay extends StatelessWidget {
  final int value;
  final String label;

  const NumberDisplay({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 42),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFF6EBFF),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedFlipCounter(
              value: value,
              wholeDigits: 4,
              duration: Duration(milliseconds: 1500),
              textStyle: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8C00FF),
              ),
            ),
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}