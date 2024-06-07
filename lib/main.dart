import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hopelift/components/my_button.dart';
import 'package:hopelift/pages/login/login_widget.dart';
import 'package:hopelift/pages/signup/signup_widget.dart';
// import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(22, 38, 46, 1),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              semanticsLabel: 'Your SVG Image',
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
            ),
            Text(
              "Elevating lives,One time at a time",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 150),
            MyButton(
              color: Color.fromRGBO(50, 133, 50, 1),
              text: "Log In",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              sizeRation: 0.6,
            ),
            SizedBox(height: 20),
            MyButton(
              color: Color.fromRGBO(50, 133, 50, 1),
              text: "Sign Up",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              sizeRation: 0.6,
            ),
          ],
        )),
      ),
    );
  }
}
