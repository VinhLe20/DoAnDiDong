import 'package:flutter/material.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({super.key});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_rounded),
        title: const Text("Điện Tử Công Nghệ"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset("assets/ip15.jpg"),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Điện Thoại Iphone 15 Pro Max 1TB",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Text(
                              "đ 50.990.000",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Text(
                              "đ 46.990.000",
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(child: Text("Đã Bán : 1")),
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
