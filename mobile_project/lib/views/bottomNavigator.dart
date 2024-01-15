import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      elevation: 0,
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_filled), label: 'Trang chủ'),
          NavigationDestination(icon: Icon(Icons.category_outlined), label: 'Danh mục'),
          NavigationDestination(icon: Icon(Icons.notification_important_outlined), label: 'Thông báo'),
          NavigationDestination(icon: Icon(Icons.account_box_outlined), label: 'Tài khoản')
        ],
      );
  }
}