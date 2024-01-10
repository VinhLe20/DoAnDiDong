import 'package:flutter/material.dart';
import 'package:mobile_project/views/HomeScreen.dart';
import 'package:mobile_project/views/Profile.dart';
import 'package:mobile_project/views/Quanlytaikhoan.dart';
import 'package:mobile_project/views/donhangcuatoi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Profile(),
    );
  }
}
