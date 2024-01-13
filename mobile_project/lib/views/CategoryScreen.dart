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
      //bottomNavigationBar: BottomNavigator(),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width / 3 - 30,
                decoration: const BoxDecoration(color: Colors.grey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/thethaovadulich.png",
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                    Text("Thể thao & du lịch", textAlign: TextAlign.center)
                  ],
                ),
              ),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width / 3 - 30,
                decoration: const BoxDecoration(color: Colors.grey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/otoxemay.png",
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                    Text("Ô tô- xe máy", textAlign: TextAlign.center),
                  ],
                ),
              ),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width / 3 - 30,
                decoration: const BoxDecoration(color: Colors.grey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/bachoa.png",
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                    Text("Bách hóa online", textAlign: TextAlign.center)
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/nha.png",
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                      Text("Nhà cửa", textAlign: TextAlign.center)
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/giay.png",
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                      Text("Giày dép", textAlign: TextAlign.center)
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/maytinh.png",
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                      Text("Máy tính & Laptop", textAlign: TextAlign.center)
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/dongho.png",
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                      Text("Đồng hồ", textAlign: TextAlign.center)
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  decoration: const BoxDecoration(color: Colors.grey),
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
                  height: 120,
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  decoration: const BoxDecoration(color: Colors.grey),
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
    );
  }
}
