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
                  SingleChildScrollView(
                      child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child:Icon(Icons.store)
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Nguyễn Đình Anh"),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "Chờ Xác Nhận",
                            style: TextStyle(fontSize: 20, color: Colors.red),
                            textAlign: TextAlign.right,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                                height: 40,
                              ),
                              const Text(
                                "đ 46.990.000",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(child: Text("Số Lượng : 1")),
                                  Expanded(
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Xác Nhận",
                                          style: TextStyle(color: Colors.red),
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                    ]),
                  )),
                  Center(child: Text('Tab 2 Content')),
                  Center(child: Text('Tab 3 Content')),
                  Center(child: Text('Tab 4 Content')),
                ],
              ),
            )));
  }
}
