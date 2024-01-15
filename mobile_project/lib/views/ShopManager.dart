import 'package:flutter/material.dart';
import 'package:mobile_project/views/OrderConfirmationPage.dart';
import 'package:mobile_project/views/ProductManagerScreen.dart';

class ShopsManager extends StatefulWidget {
  const ShopsManager({super.key});

  @override
  State<ShopsManager> createState() => _ShopsManagerState();
}

class _ShopsManagerState extends State<ShopsManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductMangerScreen()));
            },
            child: Container(
              height: 50,
              color: Colors.grey.shade400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Quản lý sản phẩm',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Icon(Icons.arrow_right_alt_rounded)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderConfirmationPage()));
            },
            child: Container(
              height: 50,
              color: Colors.grey.shade400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Các đơn cần xác nhận',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Icon(Icons.arrow_right_alt_rounded)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
