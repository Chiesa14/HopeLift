import 'package:flutter/material.dart';
import 'package:hopelift/components/my_appbar.dart';

class Testimonials extends StatefulWidget {
  const Testimonials({super.key});

  @override
  State<Testimonials> createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MyAppBar(
          title: 'Testimonies',
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
          "Testimonials",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
