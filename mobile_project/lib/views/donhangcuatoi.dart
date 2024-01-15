import 'package:flutter/material.dart';
import 'package:mobile_project/models/Order.dart';
import 'package:mobile_project/views/MainSCreen.dart';

class donhangcuatoi extends StatefulWidget {
  donhangcuatoi({super.key, required this.initialIndex});
  int initialIndex;
  @override
  State<donhangcuatoi> createState() => _donhangcuatoiState();
}

class _donhangcuatoiState extends State<donhangcuatoi> {
  static List<Order2> oders =
      List.filled(0, Order2("", 0, "", "", 0, "", ""), growable: true);
  void _loadData() {
    Order2.getData("0937569365").then((value) {
      setState(() {
        oders = Order2.oders;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Order2.oders.clear();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initialIndex,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
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
            ListView.builder(
              itemCount: oders.length, // The number of items in the list
              itemBuilder: (BuildContext context, int index) {
                return ChoXacNhan(
                    oders[index].image,
                    oders[index].productName,
                    oders[index].totalAmount,
                    oders[index].quantity,
                    oders[index].status);
              },
            ),
            Center(child: Text('Tab 2 Content')),
            Center(child: Text('Tab 3 Content')),
            Center(child: Text('Tab 4 Content')),
          ],
        ),
      ),
    );
  }
}

ChoXacNhan(String image, String name, int total, int quantity, String status) {
  return Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(height: 50, width: 50, child: Icon(Icons.store)),
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
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 150,
          child: Image.network(image, fit: BoxFit.cover),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "đ $total",
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Text("Số Lượng : $quantity")),
                Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Hủy đơn hàng",
                        style: TextStyle(color: Colors.red),
                      )),
                )
              ],
            ),
          ],
        ))
      ],
    )
  ]);
}
