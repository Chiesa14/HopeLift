import 'package:flutter/material.dart';
import 'package:hopelift/components/my_appbar.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MyAppBar(
          title: 'Comments',
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
          "Comments",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
