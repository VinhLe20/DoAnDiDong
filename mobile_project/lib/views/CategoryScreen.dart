import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh mục sản phẩm"),
        actions: const [
          Icon(Icons.shopping_cart),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Icon(Icons.chat_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: const BoxDecoration(color: Colors.black54),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.sports),
                        Text("Thể thao & du lịch", textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: const BoxDecoration(color: Colors.black54),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.sports),
                        Text("Ô tô- xe máy", textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: const BoxDecoration(color: Colors.black54),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.sports),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text("Bách hóa online",
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 3 - 30,
                      decoration: const BoxDecoration(color: Colors.black54),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.sports),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text("Nhà cửa", textAlign: TextAlign.center),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 3 - 30,
                      decoration: const BoxDecoration(color: Colors.black54),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.sports),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text("Sắc đẹp", textAlign: TextAlign.center),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 3 - 30,
                      decoration: const BoxDecoration(color: Colors.black54),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.sports),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text("Máy tính & Laptop",
                                textAlign: TextAlign.center),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 3 - 30,
                      decoration: const BoxDecoration(color: Colors.black54),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.sports),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text("Đồng hồ", textAlign: TextAlign.center),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 3 - 30,
                      decoration: const BoxDecoration(color: Colors.black54),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/Thoitrangnam.png",
                            fit: BoxFit.cover,
                            width: 70,
                            height: 70,
                          ),
                          Text("Thời trang nam", textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 3 - 30,
                      decoration: const BoxDecoration(color: Colors.black54),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/Thoitrangnu.png",
                            fit: BoxFit.cover,
                            width: 70,
                            height: 70,
                          ),
                          Text("Thời trang nữ", textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
