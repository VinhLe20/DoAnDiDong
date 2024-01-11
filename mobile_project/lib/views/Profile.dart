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
  final TextEditingController _ten = TextEditingController();
  final controller = Get.put(imagePicker());
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
    bool ontap = false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
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
                onPressed: () {
                  controller.pickImage();
                  ontap = true;
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() {
                    return Column(
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
                                    child: Image.file(
                                        File(controller.image.value.path))),
                              ]),
                          const Text("Chỉnh sửa hình ảnh"),
                        ]);
                  }),
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
                controller: _ten,
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
                controller: _ten,
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
                    controller.uploadImageToFirebase();
                    controller.updateAccount(
                        "0937569365", controller.networdImage.value.toString());
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
