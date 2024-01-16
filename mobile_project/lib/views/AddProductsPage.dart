import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/ImagePicker.dart';
import 'package:mobile_project/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductsPage extends StatefulWidget {
  const AddProductsPage({super.key});

  @override
  State<AddProductsPage> createState() => _AddProductsPageState();
}

class _AddProductsPageState extends State<AddProductsPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _describe = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _Tenshop = TextEditingController();
  var _phone = '0927968410';
  //  String phoneNumber = UserData.phoneNumber;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  imagePicker image = imagePicker();
  @override
  void initState() {
    super.initState();
    _fetchCurrentUser();
  }

  Future<void> _fetchCurrentUser() async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      setState(() {
        _user = currentUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_rounded),
        title: Text("Thêm Sản Phẩm"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: () async {
                  await image.pickImage();
                  setState(() {});
                },
                child: Container(
                  child: Image.file(File(imagePicker.path), fit: BoxFit.cover),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 200),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0))),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Tên Sản Phẩm ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: _name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: Icon(Icons.shopping_cart_rounded),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Gía Sản Phẩm ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: _price,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: Icon(Icons.price_change),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Mô Tả Sản Phẩm ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: _describe,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: Icon(Icons.description),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Số lượng",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: _quantity,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: Icon(Icons.class_),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    saveProduct();
                    //   updateProduct(_user?.phoneNumber, _Tenshop.text);
                    // updateProduct(_phone, _Tenshop.text);
                  },
                  child: Text(
                    "Lưu",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(180, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      backgroundColor: Colors.blue),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Future<void> updateProduct(String? phone, String tenshop) async {
    Map<String, dynamic> dataToUpdate;
    CollectionReference saler = FirebaseFirestore.instance.collection('saler');
    QuerySnapshot querySnapshot = await saler.get();
    querySnapshot.docs.forEach((doc) async {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (phone == data["phone"]) {
        CollectionReference collection =
            FirebaseFirestore.instance.collection('product');
        DocumentReference document = collection.doc(doc.id);
        if (!tenshop.isNotEmpty)
          dataToUpdate = {'Tenshop': tenshop};
        else {
          dataToUpdate = {'Tenshop': tenshop};
        }
        try {
          await document.update(dataToUpdate);
        } catch (e) {}
      }
    });
  }

  Future<void> addProduct(Product product) async {
    try {
      await FirebaseFirestore.instance
          .collection('product')
          .doc(product.TenSP)
          .set(product.tomap());
    } catch (e) {
      print('Error adding profile to Firestore: $e');
    }
  }

  void saveProduct() {
    Product product = Product(
        Tenshop: _Tenshop.text,
        TenSP: _name.text,
        GiaSP: _price.text,
        Giamgia: _price.text,
        MoTa: _describe.text,
        SoLuong: _quantity.text,
        Image: "",
        Sdt: '0927968410',
        Trangthai: true);
    addProduct(product);
  }
}
