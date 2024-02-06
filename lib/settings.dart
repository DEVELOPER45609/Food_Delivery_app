import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/services.dart';
import 'package:favorite_button/favorite_button.dart';

import 'package:food_delivery_app/food_delivery.dart';
import 'package:food_delivery_app/home.dart';
import 'package:food_delivery_app/settings.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: false, // Replace with actual logic for dark mode
                onChanged: (value) {
                  // Implement logic for changing dark mode
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                // Implement logic for changing password
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FoodDelivery()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with TickerProviderStateMixin {
  int currentIndex = 0;
  late PageController _pageController;
  late ScrollController _scrollController;
  var _selectedTab = _SelectedTab.settings;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _scrollController = ScrollController();
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        items: [
          DotNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Icon(Icons.explore),
            ),
            selectedColor: Colors.purple,
          ),
          DotNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
              child: Icon(Icons.settings),
            ),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    );
  }

  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}

enum _SelectedTab { home, favorite, settings, person, shopping_cart }

void main() {
  runApp(
    MaterialApp(
      home: Settings(),
    ),
  );
}
