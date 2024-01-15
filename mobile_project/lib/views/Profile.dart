import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/models/Account.dart';
import 'package:mobile_project/models/ImagePicker.dart';
import 'package:mobile_project/views/AccountScreen.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _ten = TextEditingController();
  TextEditingController _diachi = TextEditingController();
  TextEditingController _phone = TextEditingController();
  imagePicker image = imagePicker();
  bool onTap = false;
  static Account acc = Account("", "", "", false, "");
  void _loadData() {
    Account.getData("0937569365").then((value) {
      setState(() {
        acc = Account.acc;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    String netword;
    _phone.text = acc.phone;
    _ten.text = acc.name;
    _diachi.text = acc.adress;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tài khoản"),
            ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Hồ sơ của tôi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                                  height: 100,
                                  width: 100,
                                  child: onTap
                                      ? Image.file(File(imagePicker.path))
                                      : Image.network(acc.image)),
                            ]),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: const Text("Chỉnh sửa hình ảnh"),
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                // thickness: 2,
                color: Colors.black,
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
              const Divider(
                // thickness: 2,
                color: Colors.black,
              ),
              const SizedBox(
                height: 170,
              ),
              Row(children: [
                const SizedBox(
                  width: 280,
                ),
                ElevatedButton(
                  onPressed: () {
                    image.uploadImageToFirebase();
                    netword = imagePicker.imageNetwork;
                    if (onTap)
                      acc.updateAccount(
                          "0937569365", netword, _ten.text, _diachi.text);
                    else
                      acc.updateAccount(
                          "0937569365", "", _ten.text, _diachi.text);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            0.0), // Đặt độ cong của góc thành 0 để tạo nút vuông
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(const Size(90, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text(
                    "Lưu",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ])
            ]),
          ],
        ),
      ),
    );
  }
}
