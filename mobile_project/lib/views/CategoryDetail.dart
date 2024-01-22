import 'package:flutter/material.dart';
import 'package:mobile_project/views/ListProduct.dart';

class CategoryDetail extends StatefulWidget {
  final String categoryName;
  const CategoryDetail({super.key, required this.categoryName});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: Text(widget.categoryName),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: ProductList(loaiSp: widget.categoryName)),
    );
  }
}
