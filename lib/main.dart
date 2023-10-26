import 'package:flutter/material.dart';
import 'home.dart'; // Import the MyHomePage widget from home.dart
import 'login.dart'; 
import 'supplier_page.dart';
import 'records_page.dart';
import 'settings.dart';
// Import the LoginPage widget from login_page.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      initialRoute: '/login', // Set the initial route to the login page
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => MyHomePage(),
        '/suppliers': (context) => SuppliersPage(),
        '/records': (context) => RecordsPage(),
        '/settings': (context) => SettingsPage(),
      },

    );
  }
}
