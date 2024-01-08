import 'package:flutter/material.dart';

class donhangcuatoi extends StatefulWidget {
  const donhangcuatoi({super.key});

  @override
  State<donhangcuatoi> createState() => _donhangcuatoiState();
}

class _donhangcuatoiState extends State<donhangcuatoi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Đơn hàng của tôi",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                bottom: TabBar(
                    labelPadding: EdgeInsets.symmetric(horizontal: 15.0),
                    labelColor: Colors.red, // Màu của tab được chọn
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.red,
                    tabs: [
                      Tab(
                        text: "Chờ xác nhận",
                      ),
                      Tab(
                        text: "Chờ giao hàng",
                      ),
                      Tab(
                        text: "Đã giao",
                      ),
                      Tab(
                        text: "Đã hủy",
                      ),
                    ]),
              ),
              body: TabBarView(
                children: [
                  Center(child: Text('Tab 1 Content')),
                  Center(child: Text('Tab 2 Content')),
                  Center(child: Text('Tab 3 Content')),
                  Center(child: Text('Tab 4 Content')),
                ],
              ),
            )));
  }
}
