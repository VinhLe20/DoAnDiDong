import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/Account.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/models/Order.dart';

class OrderPage extends StatefulWidget {
  final Product product;
  const OrderPage({super.key, required this.product});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  User? user = FirebaseAuth.instance.currentUser;
  Future<void> createOrder(Order2 order) async {
    try {
      Map<String, dynamic> orderMap = {
        'image': order.image,
        'productName': order.productName,
        'quantity': order.quantity,
        'email': user?.email,
        'userAddress': order.userAddress,
        'totalAmount': order.totalAmount,
        'status': "Chờ xác nhận",
        'nameShop': order.nameShop,
      };
      await FirebaseFirestore.instance.collection('orders').add(orderMap);
      print('Đơn hàng đã được tạo thành công!');
      Navigator.pop(context);
    } catch (e) {
      print('Lỗi khi tạo đơn hàng: $e');
    }
  }

  static Account acc = Account("", "", "", "", false, "");
  User? user = FirebaseAuth.instance.currentUser;
  void _loadData() {
    Account.getData(user?.email).then((value) {
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

  int SoLuong = 0;
  @override
  Widget build(BuildContext context) {
    String userPhone = UserProfile.userPhone;
    String userAddress = UserProfile.userAddress;
    String gia = widget.product.Giamgia;
    if (gia == "0") {
      gia = widget.product.GiaSP;
    }
    print(widget.product.GiaSP);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text("Đặt Hàng"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      widget.product.Image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.TenSP.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "đ ${gia.toString()}",
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                SoLuong--;
                                if (SoLuong < 0) {
                                  SoLuong = 0;
                                }
                              });
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            "$SoLuong",
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                SoLuong++;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              const Row(
                children: [
                  Expanded(
                      child: Text(
                    "Phương Thức Thanh Toán",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  )),
                  Expanded(
                      child: Text(
                    "Thanh Toán khi Nhận Hàng",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20),
                  )),
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Text(
                    "Điện Thoại",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  )),
                  Expanded(
                      child: Text(
                    userPhone,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 20),
                  )),
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Text(
                    "Địa Chỉ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  )),
                  Expanded(
                      child: Text(
                    userAddress,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 20),
                  )),
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
                height: 20,
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tổng Cộng ",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${(SoLuong * int.parse(gia.toString()))}VND",
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ],
                  )),
                  ElevatedButton(
                    onPressed: () {
                      Order2 order2 = Order2(
                          widget.product.TenSP.toString(),
                          SoLuong,
                          userPhone,
                          userAddress,
                          (SoLuong *
                              int.parse(widget.product.GiaSP.toString())),
                          'Chờ xác nhận',
                          widget.product.Image,
                          widget.product.Tenshop);
                      createOrder(order2);
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(180, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        backgroundColor: Colors.blue),
                    child: const Text(
                      "Mua Hàng",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
