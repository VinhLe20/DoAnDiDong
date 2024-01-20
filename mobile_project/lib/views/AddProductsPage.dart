import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/ImagePicker.dart';
import 'package:mobile_project/models/SalesRegistration.dart';
import 'package:mobile_project/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductsPage extends StatefulWidget {
  AddProductsPage({super.key, required this.nameShop});
  String nameShop;
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
  String selectedValue = 'Thể thao & du lịch';
  String netword = "";
  Saler shop = Saler(Phone: "", CCCD: "", Diachi: "", Email: "", Tenshop: "");
  //  String phoneNumber = UserData.phoneNumber;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? email = FirebaseAuth.instance.currentUser;
  User? _user;
  imagePicker image = imagePicker();
  void _loadData() {
    Saler.getData(email?.email).then((value) {
      setState(() {
        shop = Saler.saler;
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
    _fetchCurrentUser();
    _loadData();
  }

  droop() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 62.0,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(10.0), // Set your desired border radius here
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: DropdownButton<String>(
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: <String>[
          'Thể thao & du lịch',
          'Ô tô - xe máy',
          'Bách hóa online',
          'Nhà cửa',
          'Giày dép',
          'Máy tính & Đồ công nghệ',
          'Đồng hồ',
          'Thời trang nam',
          'Thời trang nữ'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
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
        backgroundColor: Colors.lightBlue[200],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Thêm Sản Phẩm"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: () async {
                  await image.pickImage();
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 200),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0))),
                child: Container(
                  child: Image.file(File(imagePicker.path), fit: BoxFit.cover),
                ),
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
                prefixIcon: const Icon(Icons.shopping_cart_rounded),
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
                prefixIcon: const Icon(Icons.price_change),
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
                prefixIcon: const Icon(Icons.description),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Số Lượng",
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
                prefixIcon: const Icon(Icons.class_),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Loại Sản Phẩm",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            droop(),
            // TextField(
            //   controller: _Loaisp,
            //   keyboardType: TextInputType.number,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10.0)),
            //     focusedBorder: const OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.black)),
            //     prefixIcon: Icon(Icons.category),
            //   ),
            // ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await image.uploadImageToFirebase();
                    netword = imagePicker.imageNetwork;
                    saveProduct();
                    //   updateProduct(_user?.phoneNumber, _Tenshop.text);
                    // updateProduct(_phone, _Tenshop.text);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(180, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: Colors.lightBlue[200]),
                  child: const Text(
                    "Lưu",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  // Future<void> updateProduct(String? phone, String tenshop) async {
  //   Map<String, dynamic> dataToUpdate;
  //   CollectionReference saler = FirebaseFirestore.instance.collection('saler');
  //   QuerySnapshot querySnapshot = await saler.get();
  //   querySnapshot.docs.forEach((doc) async {
  //     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //     if (phone == data["phone"]) {
  //       CollectionReference collection =
  //           FirebaseFirestore.instance.collection('product');
  //       DocumentReference document = collection.doc(doc.id);
  //       if (!tenshop.isNotEmpty)
  //         dataToUpdate = {'Tenshop': tenshop};
  //       else {
  //         dataToUpdate = {'Tenshop': tenshop};
  //       }
  //       try {
  //         await document.update(dataToUpdate);
  //       } catch (e) {}
  //     }
  //   });
  // }

  Future<void> addProduct(Product product) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      await FirebaseFirestore.instance
          .collection('product')
          .doc(fileName)
          .set(product.tomap());
      _showSnackBar("Thêm thành công");
    } catch (e) {
      print('Error adding profile to Firestore: $e');
      _showSnackBar("Thêm thất bại");
    }
  }

  void saveProduct() {
    Product product = Product(
        Tenshop: shop.Tenshop,
        TenSP: _name.text,
        GiaSP: _price.text,
        Giamgia: _price.text,
        MoTa: _describe.text,
        SoLuong: _quantity.text,
        loai: selectedValue,
        Image: netword,
        Sdt: shop.Phone,
        Trangthai: true);
    addProduct(product);
  }
}
