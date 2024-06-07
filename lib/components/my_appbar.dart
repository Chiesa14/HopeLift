import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatefulWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            )),
        Spacer(),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/bell.svg')),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/bookmark.svg')),
          ],
        )
      ],
    );
  }
}
