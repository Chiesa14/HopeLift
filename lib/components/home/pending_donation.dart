import 'package:flutter/material.dart';

class PendingDonation extends StatefulWidget {
  final String title;
  const PendingDonation({super.key, required this.title});

  @override
  State<PendingDonation> createState() => _PendingDonationState();
}

class _PendingDonationState extends State<PendingDonation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
