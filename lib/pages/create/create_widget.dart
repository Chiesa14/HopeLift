import 'package:flutter/material.dart';
import 'package:hopelift/components/my_appbar.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MyAppBar(
          title: 'Create Post',
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
          "Add",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
