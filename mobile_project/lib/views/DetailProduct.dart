import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/Account.dart';
import 'package:mobile_project/models/CartProduct.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/views/LoginScreen.dart';
import 'package:mobile_project/views/OrderPage.dart';
import 'package:mobile_project/views/SalesRegistration.dart';

import '../models/SalesRegistration.dart';

class DetailProduct extends StatefulWidget {
  DetailProduct({super.key, required this.pro});
  Product pro;
  @override
  State<DetailProduct> createState() => _DetailProductState();
}

var Tensp = '';
var Giasp;
var giamgia;
var soluong = 0;

Saler shop = Saler(Phone: "", CCCD: "", Diachi: "", Email: "", Tenshop: "");

class _DetailProductState extends State<DetailProduct> {
  SalesRegistration? saler;
  User? user = FirebaseAuth.instance.currentUser;

  void _loadData() {
    Saler.getData(user?.email).then((value) {
      setState(() {
        shop = Saler.saler;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> addSaler(CartProduct cartProduct) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      await FirebaseFirestore.instance
          .collection('CartProduct')
          .doc(fileName)
          .set(cartProduct.tomap());
    } catch (e) {
      print('Error adding profile to Firestore: $e');
    }
  }

  void saveSaler() {
    CartProduct cartProduct = CartProduct(
        Trangthai: false,
        email: user?.email,
        xoa: true,
        SoLuong: soluong + 1,
        TenSP: Tensp,
        GiaSP: Giasp,
        Giamgia: giamgia,
        Tenshop: widget.pro.Tenshop,
        img: widget.pro.Image);
    addSaler(cartProduct);
  }

  @override
  Widget build(BuildContext context) {
    Tensp = widget.pro.TenSP;
    String gia = widget.pro.Giamgia;
    if (gia == "0") {
      gia = widget.pro.GiaSP;
    }
    Giasp = int.parse(widget.pro.GiaSP);
    giamgia = int.parse(widget.pro.Giamgia);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: MaterialButton(
                color: Colors.blueGrey,
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text('Chat'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {
                  if (!Account.isUserLoggedIn) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                    return;
                  }
                  saveSaler();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_basket),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text('Thêm giỏ hàng'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                color: Colors.lightBlue,
                onPressed: () {
                  if (!Account.isUserLoggedIn) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(product: widget.pro),
                      ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  child: const Text('Mua ngay'),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        widget.pro.Image,
                        height: 215,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                          top: 8.0,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.blueAccent,
                              size: 24.0,
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.pro.TenSP,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          gia,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  '5',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              children: [Text('Đã bán 2,5k')],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(color: Colors.grey),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Mô tả sản phẩm',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0)),
                                  Text(widget.pro.MoTa)
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
