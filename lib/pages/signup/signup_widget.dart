// ignore_for_file: unused_field

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hopelift/components/my_button.dart';
import 'package:hopelift/components/my_inputfield.dart';
import 'package:hopelift/pages/login/login_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 200), // Adjust duration as needed
      vsync: this,
    )..repeat(reverse: true);

    // Rotation animation
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14, // Rotate 360 degrees
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    // Offset animation
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.4, 0.4),
      end: Offset(0.4, 0.4), // Move the background
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );

    // Bounce animation
    _bounceAnimation = Tween<double>(
      begin: 0.0,
      end: 200.0, // Adjust bounce range as needed
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 38, 46, 1),
      body: ListView(
        children: [
          Stack(
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAnimation.value,
                    child: FractionalTranslation(
                      translation: _offsetAnimation.value,
                      child: Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/images/bg_rounded_svg.svg',
                          semanticsLabel: 'Background SVG',
                        ),
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Create account',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(height: 40),
                    Expanded(
                      flex: 0,
                      child: Center(
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  border:
                                      Border.all(color: Colors.grey.shade500),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                  SizedBox(height: 10),
                                  MyInputField(
                                    title: "Email",
                                    placeholder: "Enter Email",
                                    height: 50,
                                    obscureText: false,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Username",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                  SizedBox(height: 10),
                                  MyInputField(
                                    title: "Username",
                                    placeholder: "Enter UserName",
                                    height: 50,
                                    obscureText: false,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Password",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                  SizedBox(height: 10),
                                  MyInputField(
                                    title: "password",
                                    placeholder: "Enter Password",
                                    height: 50,
                                    obscureText: true,
                                  ),
                                  SizedBox(height: 60),
                                  Center(
                                      child: MyButton(
                                    color: Color.fromRGBO(41, 182, 65, 1),
                                    text: "Sign In",
                                    onPressed: onPress,
                                    sizeRation: 0.4,
                                  )),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                      "Continue with:",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Center(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "Google",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 120),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Google",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Already have account? Log in",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onPress() {}
}
