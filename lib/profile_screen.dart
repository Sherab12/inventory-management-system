import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 2; // Set the index to 2 for the Profile screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('This is the Profile Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey, // Set your desired background color
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Handle navigation based on the index (0: Home, 1: Add, 2: Profile)
          if (index == 0) {
            // Navigate to Home screen
            Navigator.pushReplacementNamed(context, '/');
          } else if (index == 1) {
            // Navigate to Requisition Form screen
            Navigator.pushReplacementNamed(context, '/requisition');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
