import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/views/DetailProduct.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  const CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProduct(
              pro: product,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Image.network(product.Image),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.TenSP}',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Text(
                      'Gía : ${product.GiaSP}',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      'Gía giảm : ${product.Giamgia}',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: Text("Số Lượng :  ${product.SoLuong}")),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
