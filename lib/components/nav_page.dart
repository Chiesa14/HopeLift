import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hopelift/pages/comments/comments_widget.dart';
import 'package:hopelift/pages/create/create_widget.dart';
import 'package:hopelift/pages/home/home_widget.dart';
import 'package:hopelift/pages/profile/profile_widget.dart';
import 'package:hopelift/pages/testimonials/testimonials_widget.dart';

class NavTab extends StatefulWidget {
  const NavTab({super.key});

  @override
  State<NavTab> createState() => _NavTabState();
}

class _NavTabState extends State<NavTab> {
  int _page = 0;

  final List<Widget> pages = [
    HomePage(),
    Testimonials(),
    CreatePage(),
    CommentsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 38, 46, 1),
      bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.green,
          color: Colors.green,
          animationDuration: const Duration(milliseconds: 300),
          items: <Widget>[
            SvgPicture.asset('assets/icons/home.svg'),
            SvgPicture.asset('assets/icons/testimonial.svg'),
            Icon(
              Icons.add,
              color: Color.fromARGB(255, 211, 210, 210),
            ),
            SvgPicture.asset('assets/icons/comments.svg'),
            SvgPicture.asset('assets/icons/profile.svg'),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          }),
      body: pages[_page],
    );
  }
}
