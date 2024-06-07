import 'package:flutter/material.dart';

class MyInputField extends StatefulWidget {
  final String title;
  final String placeholder;
  final String? initialValue;
  final double height;
  final bool obscureText;

  const MyInputField(
      {super.key,
      required this.title,
      required this.placeholder,
      this.initialValue,
      required this.height,
      required this.obscureText});

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextField(
        cursorColor: Colors.white.withOpacity(0.6),
        obscureText: widget.obscureText,
        controller: _controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
          hintText: widget.placeholder,
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
