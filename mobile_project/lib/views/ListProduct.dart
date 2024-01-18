import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/views/CardProduct.dart';

class ProductList extends StatelessWidget {
  final String loaiSp;

  ProductList({required this.loaiSp});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('product')
          .where('loaisp', isEqualTo: loaiSp)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        List<Product> products = snapshot.data!.docs
            .map((DocumentSnapshot document) {
              return Product.fromMap(document.data() as Map<String, dynamic>);
            })
            .where((product) => product.Trangthai == true)
            .toList();

        List<CardProduct> productCards = products.map((product) {
          return CardProduct(product: product);
        }).toList();

        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return CardProduct(product: products[index]);
          },
        );
      },
    );
  }
}
