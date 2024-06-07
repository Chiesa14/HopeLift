import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hopelift/components/home/build_events.dart';
import 'package:hopelift/components/home/build_testomonies.dart';
import 'package:hopelift/components/my_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> events = [];
  List<Map<String, dynamic>> testimonies = [];

  @override
  void initState() {
    super.initState();
    _loadEvents();
    _loadTestimonies();
  }

  Future<void> _loadEvents() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/events.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    List<Map<String, dynamic>> eventsList =
        List<Map<String, dynamic>>.from(jsonData);

    setState(() {
      // Limit the number of events to 3
      events = eventsList.take(3).toList();
    });
  }

  Future<void> _loadTestimonies() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/testimonies.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    List<Map<String, dynamic>> testimoniesList =
        List<Map<String, dynamic>>.from(jsonData);

    setState(() {
      // Limit the number of events to 3
      testimonies = testimoniesList.take(3).toList();
    });
  }

  void _onCardTap(Map<String, dynamic> event) {
    print('Tapped on: ${event['title']}');
  }

  PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 3) {
      _pageController.animateToPage(_currentPage + 1,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(_currentPage - 1,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MyAppBar(
          title: 'Home',
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Events",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Get to know where you can offer a hand in the entire world.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return BuildEvents.buildEventCard(events[index], _onCardTap);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Continue to view more >",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                "Testimonies",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(right: 50),
                child: Text(
                  "Know the story of the ones you and kindhearted people saved.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 400,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: testimonies.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return BuildTestimonies(
                      centerImageUrl: testimonies[index]['centerImageUrl'],
                      bottomImageUrl: testimonies[index]['bottomImageUrl'],
                      topImageUrl: testimonies[index]['topImageUrl'],
                      text1: testimonies[index]['text1'],
                      text2: testimonies[index]['text2'],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: _previousPage,
                      iconSize: 15,
                      splashRadius: 25,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onPressed: _nextPage,
                      iconSize: 15,
                      splashRadius: 10,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Pending Donations",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Check the progress of the recent donations you made.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
