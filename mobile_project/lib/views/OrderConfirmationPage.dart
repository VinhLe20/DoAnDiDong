import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Các Đơn Cần Xác Nhận"),
      ),
      body: SingleChildScrollView(
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
                child: ClipOval(
                    child: Image.asset(
                  "assets/Logo.jpg",
                  fit: BoxFit.cover,
                )),
                decoration: BoxDecoration(shape: BoxShape.circle),
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
                    style: TextStyle(color: Colors.red, fontSize: 15),
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
    );
  }
}
