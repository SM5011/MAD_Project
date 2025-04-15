import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/views/home/track_page.dart';
import 'package:money_tracker/views/home/add_transaction_page.dart';
import 'package:money_tracker/views/home/settings_page.dart';
import 'package:money_tracker/views/home/profile_page.dart';
import 'package:money_tracker/views/home/home_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    TrackPage(),
    AddTransactionPage(),
    SettingsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    // ✅ Delay setState to prevent UI conflicts
    Future.delayed(Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _selectedIndex = index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Money Tracker",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.purple.shade700,
      ),
      body: _pages[_selectedIndex], // ✅ Swaps pages correctly

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.purple.shade700,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          elevation: 10,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.track_changes), label: "Tracks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle, size: 32), label: "Add"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
