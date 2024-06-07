import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildEvents {
  static Widget buildEventCard(Map<String, dynamic> event, Function onTap) {
    return InkWell(
      onTap: () => onTap(event),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          constraints: BoxConstraints(minHeight: 200),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(event['image']),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          getIconPath(event['category']),
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Align(
                        child: Padding(
                          padding: EdgeInsets.only(right: 50),
                          child: Text(
                            event['title'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static String getIconPath(String category) {
    switch (category.toLowerCase()) {
      case 'education':
        return 'assets/icons/education.svg';
      case 'treatment':
        return 'assets/icons/treatment.svg';
      case 'refugee':
        return 'assets/icons/refugee.svg';
      default:
        return 'assets/icons/treatment.svg';
    }
  }
}
