import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_project/models/User.dart';
import 'package:mobile_project/views/OTPScreen.dart';

class LoginScreen extends StatefulWidget {
  static String verify = "";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  var phone = '';
  final TextEditingController diachi = TextEditingController();
  final TextEditingController ten = TextEditingController();
  final TextEditingController shop = TextEditingController();
  final TextEditingController image = TextEditingController();
  @override
  void initState() {
    phoneNumberController.text = "+84";
    super.initState();
  }

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
      body: Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
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
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 40,
                          child: TextField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Text(
                          "|",
                          style: TextStyle(fontSize: 33, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          onChanged: (value) {
                            phone = value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () async {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber:
                                  '${phoneNumberController.text + phone}',
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                LoginScreen.verify = verificationId;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OTPScreen()));
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {});
                        },
                        child: const Text("Tiếp Tục")),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
