import 'package:flutter/material.dart';
import 'package:mobile_project/views/CartScreen.dart';
import 'package:mobile_project/views/CategoryDetail.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String category1 = 'Thể thao & du lịch';
  String category2 = 'Ô tô - xe máy';
  String category3 = 'Bách hóa online';
  String category4 = 'Nhà cửa';
  String category5 = 'Giày dép';
  String category6 = 'Máy tính & Đồ công nghệ';
  String category7 = 'Đồng hồ';
  String category8 = 'Thời trang nam';
  String category9 = 'Thời trang nữ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: BottomNavigator(),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: const Text("Danh mục sản phẩm"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CategoryDetail(categoryName: category1)),
                  );
                },
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[200],
                  ),
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
                      Text(category1, textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CategoryDetail(categoryName: category2)),
                  );
                },
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  decoration: BoxDecoration(color: Colors.lightBlue[200]),
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
                      Text(category2, textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CategoryDetail(categoryName: category3)),
                  );
                },
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  decoration: BoxDecoration(color: Colors.lightBlue[200]),
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
                      Text(category3, textAlign: TextAlign.center)
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryDetail(categoryName: category4)),
                    );
                  },
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: BoxDecoration(color: Colors.lightBlue[200]),
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
                        Text(category4, textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryDetail(categoryName: category5)),
                    );
                  },
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: BoxDecoration(color: Colors.lightBlue[200]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/giay.png",
                          fit: BoxFit.cover,
                          width: 70,
                          height: 70,
                        ),
                        Text(category5, textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryDetail(categoryName: category6)),
                    );
                  },
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: BoxDecoration(color: Colors.lightBlue[200]),
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
                        Text(category6, textAlign: TextAlign.center)
                      ],
                    ),
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryDetail(categoryName: category7)),
                    );
                  },
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: BoxDecoration(color: Colors.lightBlue[200]),
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
                        Text(category7, textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryDetail(categoryName: category8)),
                    );
                  },
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: BoxDecoration(color: Colors.lightBlue[200]),
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
                        Text(category8, textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryDetail(categoryName: category9)),
                    );
                  },
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    decoration: BoxDecoration(color: Colors.lightBlue[200]),
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
                        Text(category9, textAlign: TextAlign.center)
                      ],
                    ),
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
