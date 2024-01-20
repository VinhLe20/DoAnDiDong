import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/Account.dart';
import 'package:mobile_project/views/AccountScreen.dart';
import 'package:mobile_project/views/CategoryScreen.dart';
import 'package:mobile_project/views/HomeScreen.dart';
import 'package:mobile_project/views/LoginScreen.dart';
import 'package:mobile_project/views/NotificationsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const NotificationsScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          bool login = prefs.getBool("login") ?? false;
          Account.isUserLoggedIn = login;
          if (index == 3 && !Account.isUserLoggedIn || index == 3 && !login) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
            return;
          }
          setState(() {
            _currentIndex = index;
          });
        },
        selectedLabelStyle: TextStyle(color: Colors.lightBlue[200]),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.lightBlue[200],
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Danh mục',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }
}
