import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_project/models/Account.dart';
import 'package:mobile_project/views/ForgetScreen.dart';
import 'package:mobile_project/views/MainSCreen.dart';
import 'package:mobile_project/views/Profile.dart';
import 'package:mobile_project/views/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('login', true);
      print(prefs.getBool('login')??false);
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      print("Error during login: $e");
      _showSnackBar("Sai email hoặc mật khẩu vui lòng nhập lại !");
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    return SafeArea(
      child: Scaffold(
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
                  SizedBox(
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
                      const Text("Đăng nhập tài khoản "),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Register()));
                          },
                          child: const Text("Tạo Tài Khoản Mới"))
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 40),
                            backgroundColor: Colors.lightBlue[200]),
                        onPressed: () {
                          signInWithEmailAndPassword(email, password);
                        },
                        child: const Text(
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
                          child: const Text("Bạn đã quên mật khẩu ?"))
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
