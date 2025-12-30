import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show BuildContext, Center, Colors, IndexedStack, Scaffold, State, StatefulWidget, Text, Widget, showModalBottomSheet, MaterialPageRoute;

import 'package:fixit/Home/home_screen.dart';
import 'package:fixit/Auth/login_sheet.dart';
import 'package:fixit/Search/search_result_screen.dart';
import 'package:fixit/widgets/main_bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool isLoggedIn = false;

  void _showLoginSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const LoginSheet(),
    );
  }

  void _openSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchResultScreen(
          currentIndex: _selectedIndex,
          onNavTap: (index) {
            if ((index == 2 || index == 3) && !isLoggedIn) {
              _showLoginSheet();
            } else {
              setState(() => _selectedIndex = index);
              Navigator.pop(context); // back to MainScreen
            }
          },
        ),
      ),
    );
  }

  late final List<Widget> _screens = [
    HomeScreen(onSearchTap: _openSearch), // ✅ FIXED
    const Center(child: Text("City Screen")),
    const Center(child: Text("Order Screen")),
    const Center(child: Text("Profile Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: MainBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          if ((index == 2 || index == 3) && !isLoggedIn) {
            _showLoginSheet();
          } else {
            setState(() => _selectedIndex = index);
          }
        },
      ),
    );
  }
}
