import 'package:flutter/material.dart';
import 'requisition_form.dart'; // Import the requisition form screen
import 'profile_screen.dart'; // Import the profile screen

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

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
                // Handle menu item tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Summary'),
              onTap: () {
                // Handle menu item tap
                Navigator.pop(context); // Close the drawer
              },
              // Add more menu items as needed
            ),
            ListTile(
              title: Text('Add'),
              onTap: () {
                // Handle Add button tap by navigating to RequisitionFormScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RequisitionFormScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Your Content Goes Here'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Handle navigation based on the index (0: Home, 1: Add, 2: Profile)
          if (index == 1) {
            // Navigate to Requisition Form screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RequisitionFormScreen()),
            );
          } else if (index == 2) {
            // Navigate to Profile screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
          // You can add more conditions for other icons if needed.
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
