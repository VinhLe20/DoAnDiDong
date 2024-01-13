import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/product.dart';

class ProductEditPage extends StatefulWidget {
  const ProductEditPage({super.key});

  @override
  State<ProductEditPage> createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _describe = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_rounded),
        title: Text("Chỉnh Sửa Sản Phẩm"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  child: Image.asset("assets/ip15.jpg"),
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
                prefixIcon: Icon(Icons.class_),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    delProduct();
                  },
                  child: Text(
                    "Xóa",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      backgroundColor: Colors.blue),
                ),
                SizedBox(
                  width: 65,
                ),
                ElevatedButton(
                  onPressed: () {
                    upProduct();
                  },
                  child: Text(
                    "Lưu",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 60),
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

  Future<void> updateProduct(Product product) async {
    try {
      await FirebaseFirestore.instance
          .collection('product')
          .doc(product.TenSP)
          .update(product.tomap());
    } catch (e) {
      print('Error adding profile to Firestore: $e');
    }
  }

  void upProduct() {
    Product product = Product(
        TenSP: _name.text,
        GiaSP: _price.text,
        MoTa: _describe.text,
        SoLuong: _quantity.text,
        Trangthai: true,
        Tenshop: '',
        Giamgia: '',
        Sdt: '');
    updateProduct(product);
  }

  void delProduct() {
    Product product = Product(
        TenSP: _name.text,
        GiaSP: "",
        MoTa: "",
        SoLuong: "",
        Trangthai: false,
        Tenshop: '',
        Giamgia: '',
        Sdt: '');
    updateProduct(product);
  }
}
