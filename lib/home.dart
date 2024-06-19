import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:ubs_dei_app/bottom_navigation_bar.dart';
import 'package:ubs_dei_app/resources_page.dart';
import 'package:ubs_dei_app/events_page.dart';
import 'package:ubs_dei_app/forums_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override 
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final currentUserID = FirebaseAuth.instance.currentUser?.uid;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    EventsPage(),
    ForumsPage(),
    Text('Games'),
    ResourcesPage(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UBS DEI App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ]
                  ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

