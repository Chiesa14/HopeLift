import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;
  final double sizeRation;

  MyButton({
    required this.color,
    required this.text,
    required this.onPressed,
    required this.sizeRation,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: color, // Text color
        padding: EdgeInsets.symmetric(vertical: 16),
        minimumSize: Size(sizeRation * MediaQuery.of(context).size.width,
            0), // Button padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded borders
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
