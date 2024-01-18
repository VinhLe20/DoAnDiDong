import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_project/views/AccountScreen.dart';
import 'package:mobile_project/views/AddProductsPage.dart';
import 'package:mobile_project/views/CartScreen.dart';
import 'package:mobile_project/views/CategoryDetail.dart';
import 'package:mobile_project/views/CategoryScreen.dart';
import 'package:mobile_project/views/DetailProduct.dart';
import 'package:mobile_project/views/HomeScreen.dart';
import 'package:mobile_project/views/LoginScreen.dart';
import 'package:mobile_project/views/MainSCreen.dart';
import 'package:mobile_project/views/Profile.dart';
import 'models/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/cart': (context) => CartScreen(),
        '/changeProfile': (context) => const Profile(),
        '/profile': (context) => const AccountScreen()
      },
    );
  }
}
