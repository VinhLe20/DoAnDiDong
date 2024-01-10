import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductMangerScreen extends StatefulWidget {
  const ProductMangerScreen({super.key});

  @override
  State<ProductMangerScreen> createState() => _ProductMangerScreenState();
}

class _ProductMangerScreenState extends State<ProductMangerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý sản phẩm"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 100,
                  height: 100,
                  child: const Placeholder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ten sp"),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("đơn giá"),
                          Text("da ban"),
                          Icon(Icons.edit)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
