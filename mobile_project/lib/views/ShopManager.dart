import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/SalesRegistration.dart';
import 'package:mobile_project/views/OrderConfirmationPage.dart';
import 'package:mobile_project/views/ProductManagerScreen.dart';

class ShopsManager extends StatefulWidget {
  const ShopsManager({super.key});

  @override
  State<ShopsManager> createState() => _ShopsManagerState();
}

class _ShopsManagerState extends State<ShopsManager> {
  User? user = FirebaseAuth.instance.currentUser;
  static Saler shop =
      Saler(Phone: "", CCCD: "", Diachi: "", Email: '', Tenshop: "");
  void _loadNameShop() {
    Saler.getData(user?.email).then((value) {
      setState(() {
        shop = Saler.saler;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadNameShop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: const Text('Shop'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductMangerScreen(nameShop: shop.Tenshop)));
            },
            child: const SizedBox(
              height: 50,
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Quản lý sản phẩm",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderConfirmationPage(
                            tenShop: shop.Tenshop,
                          )));
            },
            child: const SizedBox(
              height: 50,
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text("Các đơn cần xác nhận",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
