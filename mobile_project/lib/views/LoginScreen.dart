import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_project/models/Account.dart';
import 'package:mobile_project/views/ForgetScreen.dart';
import 'package:mobile_project/views/MainSCreen.dart';
import 'package:mobile_project/views/Profile.dart';
import 'package:mobile_project/views/Register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Account.isUserLoggedIn = true;
    } catch (e) {
      print("Error during login: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[200],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            },
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
                Row(
                  children: [
                    Text("Đăng nhập tài khoản "),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Register()));
                        },
                        child: Text("Tạo Tài Khoản Mới"))
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Email",
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: isObscure,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          icon: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          backgroundColor: Colors.lightBlue[200]),
                      onPressed: () {
                        signInWithEmailAndPassword(email, password);
                        Account.isUserLoggedIn = true;
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      child: Text(
                        "Đăng Nhập",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ForgetScreen()));
                        },
                        child: Text("Bạn đã quên mật khẩu ?"))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
