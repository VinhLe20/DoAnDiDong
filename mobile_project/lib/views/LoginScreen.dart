import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[200],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 450,
                  child: Image.asset("assets/Logo.jpg"),
                ),
                const Row(
                  children: [
                    Text(
                      "Xin Chào,",
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
                const Row(
                  children: [Text("Đăng nhập tài khoản hoặc tạo tài khoản")],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: 'Số điện thoại',
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Tiếp Tục",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20.0),
                      minimumSize: Size(400.0, 50.0),
                      backgroundColor: Colors.red),
                )
              ],
            ),
          ),
        ));
  }
}
