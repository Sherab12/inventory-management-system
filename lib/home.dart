import 'package:flutter/material.dart';
import 'requisition_form.dart'; // Import the requisition form screen
import 'profile_screen.dart'; // Import the profile screen

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // Create pages for each tab
  final List<Widget> _pages = [
    Center(
      child: Text('Your Home Content Goes Here'),
    ),
    RequisitionFormScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                'assets/CST-Logo.png', // Replace this with your logo image asset
                height: 150, // Set the height of the logo as per your design
              ),
            ),
            Spacer(),
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notification button press
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      child: Image.asset(
                        'assets/logo-no-background.png', // Replace this with your logo image asset
                        height: 90, // Set the height of the logo inside the circular avatar
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                // Set the current page to the home page
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Add'),
              onTap: () {
                // Set the current page to the Requisition Form
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Set the current page to the Profile screen
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
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
