import 'package:flutter/material.dart';
import 'package:req/login.dart';
import 'requisition_form.dart'; // Import the requisition form screen
import 'profile_screen.dart';
import 'supplier_page.dart';
import 'records_page.dart';
import 'settings.dart';
// Import the profile screen

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
    RequisitionFormScreen(), // Use Requisition page
    ProfileScreen(), // Use Profile page
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
                      radius: 40,
                      child: Image.asset(
                        'assets/logo-no-background.png', // Replace this with your logo image asset
                        height: 80, // Set the height of the logo inside the circular avatar
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Add Requisition'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Suppliers'),
              onTap: () {
                // Navigate to Suppliers page
                Navigator.push(context, MaterialPageRoute(builder: (context) => SuppliersPage()));
              },
            ),
            ListTile(
              title: Text('Records'),
              onTap: () {
                // Navigate to Records page
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecordsPage()));
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Navigate to Settings page
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                // Navigate to Logout page
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: _currentIndex >= 0 && _currentIndex < _pages.length
          ? _pages[_currentIndex]
          : Center(
              child: Text('Invalid Page Index'),
            ),
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
