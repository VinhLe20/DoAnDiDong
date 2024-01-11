import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_project/views/CartScreen.dart';
import 'package:mobile_project/views/DetailProduct.dart';
import 'package:mobile_project/views/ShopManager.dart';
import 'models/firebase_options.dart';
import 'package:mobile_project/views/AddProductsPage.dart';
import 'package:mobile_project/views/HomeScreen.dart';
import 'package:mobile_project/views/LoginScreen.dart';
import 'package:mobile_project/views/OrderConfirmationPage.dart';
import 'package:mobile_project/views/OrderPage.dart';
import 'package:mobile_project/views/ProductEditPage.dart';
import 'package:mobile_project/views/SalesRegistration.dart';

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
// <<<<<<< HEAD
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         // initialRoute: '/',
//         // routes: {
//         //   '/': (context) => const HomeScreen(),
//         //   '/detailProduct': (context) => const DetialProduct(),
//         //   '/cart': (context) => const CartScreen()
//         //  },
//         home: HomeScreen());
// =======
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/detailProduct': (context) => const DetialProduct(),
        '/cart': (context) => const CartScreen()
      },
    );
  }
}
