import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          label: 'Forums',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.gamepad),
          label: 'Games',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Resources',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: widget.currentIndex,
      selectedItemColor: Colors.amber[800],
      onTap: widget.onTap,
      type: BottomNavigationBarType.fixed, 
    );
  }
}