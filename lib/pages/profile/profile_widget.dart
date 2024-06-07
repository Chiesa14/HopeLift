import 'package:flutter/material.dart';
import 'package:hopelift/components/my_appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MyAppBar(
          title: 'Profile',
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
