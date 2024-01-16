import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/ImagePicker.dart';
import 'package:mobile_project/models/product.dart';

class ProductEditPage extends StatefulWidget {
  ProductEditPage({super.key,required this.product ,required this.nameShop});
  Product product;
  String nameShop;
  @override
  State<ProductEditPage> createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _describe = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  imagePicker image = imagePicker();
  bool onTap = false;
  @override
  Widget build(BuildContext context) {
    _name.text = widget.product.TenSP;    _price.text = widget.product.GiaSP;
    _describe.text = widget.product.MoTa;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context,true);
        }, icon:  const Icon(Icons.arrow_back_rounded)),
        title: const Text("Chỉnh Sửa Sản Phẩm"),
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
                        setState(() {
                          onTap = true;
                        });
                      },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 200),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0))),
                child: Container(
                  child: onTap
                              ? Image.file(File(imagePicker.path),
                                  fit: BoxFit.cover)
                              : Image.network(widget.product.Image,
                                  fit: BoxFit.cover),
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
                    "Loại Sản Phẩm ",
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
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: const Icon(Icons.class_),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // delProduct();
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      backgroundColor: Colors.blue),
                  child: const Text(
                    "Xóa",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 65,
                ),
                ElevatedButton(
                  onPressed: () {
                    image.uploadImageToFirebase();
                      Product update = Product(
      Image: imagePicker.imageNetwork,
        TenSP: _name.text,
        GiaSP: _price.text,
        MoTa: _describe.text,
        SoLuong: _quantity.text,
        Trangthai: true,
        Tenshop: widget.nameShop,
        Giamgia: '',
        Sdt: '');
                    upProduct(update,widget.product.TenSP);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      backgroundColor: Colors.blue),
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

  Future<void> updateProduct(
      Product pro,String Name) async {
    Map<String, dynamic> dataToUpdate;
    CollectionReference users = FirebaseFirestore.instance.collection('product');
    QuerySnapshot querySnapshot = await users.get();
    querySnapshot.docs.forEach((doc) async {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (data["tensp"] == Name && data["Tenshop"] == pro.Tenshop) {
        DocumentReference document = users.doc(doc.id);
        if (pro.Image.isNotEmpty) {
          dataToUpdate = {'Image': pro.Image, 'tensp': pro.TenSP, 'giasp': pro.GiaSP,'MoTa':pro.MoTa};
        } else {
          dataToUpdate = { 'tensp': pro.TenSP, 'giasp': pro.GiaSP,'MoTa':pro.MoTa};
        }
        try {
          await document.update(dataToUpdate);
        } catch (e) {}
      }
    });
  }

  void upProduct(Product product,String name) {
  
    updateProduct(product,name);
  }

  // void delProduct() {
  //   Product product = Product(
  //     Image: "",
  //       TenSP: _name.text,
  //       GiaSP: "",
  //       MoTa: "",
  //       SoLuong: "",
  //       Trangthai: false,
  //       Tenshop: '',
  //       Giamgia: '',
  //       Sdt: '');
  //       String name;
  //   updateProduct(product,name);
  // }
}
