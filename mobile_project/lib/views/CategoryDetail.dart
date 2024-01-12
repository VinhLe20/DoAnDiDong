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
        leading: Icon(Icons.arrow_back_rounded),
        title: Text("Điện Tử Công Nghệ"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          child: Image.asset("assets/ip15.jpg"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Điện Thoại Iphone 15 Pro Max 1TB",
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            const Text(
                              "đ 50.990.000",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            const Text(
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
