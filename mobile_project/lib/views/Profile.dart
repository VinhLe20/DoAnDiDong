import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/Account.dart';
import 'package:mobile_project/models/ImagePicker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _ten = TextEditingController();
  final TextEditingController _diachi = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  imagePicker image = imagePicker();
  bool onTap = false;
  static Account acc = Account("", "", "", "", false, "");
  User? user = FirebaseAuth.instance.currentUser;
  void _loadData() {
    Account.getData(user?.email).then((value) {
      setState(() {
        acc = Account.acc;
      });
    });
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
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    String netword;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tài khoản"),
            ]),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: ()async {
          image.uploadImageToFirebase();
          netword = imagePicker.imageNetwork;
          try {
            if (onTap) {
              await acc.updateAccount(user?.email, netword, _ten.text, _diachi.text);
            } else {
             await acc.updateAccount(user?.email, "", _ten.text, _diachi.text);
            }
            _showSnackBar("Thay đổi thông tin thành công");
          } catch (e) {}
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  0.0), 
            ),
          ),
          minimumSize: MaterialStateProperty.all(const Size(90, 50)),
          backgroundColor: MaterialStateProperty.all<Color>( Colors.lightBlue[200]!),
          
        ),
        child: const Text(
          "Lưu",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all( 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hồ sơ của tôi",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await image.pickImage();
                        setState(() {
                          onTap = true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 130,
                                      width: 130,
                                      child: ClipOval(
                                        child:acc.image.isNotEmpty? onTap
                                            ? Image.file(File(imagePicker.path),
                                                fit: BoxFit.cover)
                                            : Image.network(acc.image,
                                                fit: BoxFit.cover):Image.asset("assets/Logo.jpg"),
                                      ),
                                    ),
                                  ]),
                              const Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Text("Chỉnh sửa hình ảnh"),
                              ),
                            ]),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _ten,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "Tên Người dùng",
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: const TextStyle(color: Colors.black),
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0,
                                  color: Colors.white,
                                  style: BorderStyle.none)),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _phone,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "Điện thoại",
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: const TextStyle(color: Colors.black),
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0,
                                  color: Colors.white,
                                  style: BorderStyle.none)),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _diachi,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          filled: true,
                          labelText: "Địa chỉ",
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelStyle: const TextStyle(color: Colors.black),
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0,
                                  color: Colors.white,
                                  style: BorderStyle.none)),
                          prefixIcon: const Icon(
                            Icons.home,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                 
                    const SizedBox(
                      height: 170,
                    ),
                    const Row(children: [
                      SizedBox(
                        width: 280,
                      ),
                    ])
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
