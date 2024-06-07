import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildTestimonies extends StatefulWidget {
  final String centerImageUrl;
  final String text1;
  final String text2;
  final String? topImageUrl;
  final String? bottomImageUrl;
  const BuildTestimonies({
    Key? key,
    required this.centerImageUrl,
    required this.text1,
    required this.text2,
    this.topImageUrl,
    this.bottomImageUrl,
  }) : super(key: key);

  @override
  State<BuildTestimonies> createState() => _BuildTestimoniesState();
}

class _BuildTestimoniesState extends State<BuildTestimonies> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(
              "assets/svg/circular_line.svg",
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          if (widget.topImageUrl != null)
            Positioned(
              top: 0,
              right: 0,
              child: Stack(
                children: [
                  ClipOval(
                    child: Image.asset(
                      widget.topImageUrl!,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          if (widget.bottomImageUrl != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: Stack(
                children: [
                  ClipOval(
                    child: Image.asset(
                      widget.bottomImageUrl!,
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      height: 70,
                      width: 70,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          Align(
            alignment: Alignment.centerRight,
            child: ClipOval(
              child: Image.asset(
                widget.centerImageUrl,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          Padding(
            padding: EdgeInsets.only(right: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text1,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  widget.text2,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
