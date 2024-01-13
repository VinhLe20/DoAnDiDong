import 'package:flutter/material.dart';
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
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text('Shop'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductMangerScreen()));
                    },
                    child: const Text('Quản lý sản phẩm',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_right_alt_rounded))
              ],
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            color: Colors.grey.shade400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text('Các đơn cần xác nhận',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_right_alt_rounded))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
