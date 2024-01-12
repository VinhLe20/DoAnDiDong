import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int SoLuong = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đặt Hàng"),
        leading: Icon(Icons.arrow_back_outlined),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
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
                    width: 16,
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
                        height: 50,
                      ),
                      const Text(
                        "đ 46.990.000",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  SoLuong++;
                                });
                              },
                              icon: Icon(Icons.remove)),
                          Text("$SoLuong"),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  SoLuong--;
                                  if (SoLuong < 0) {
                                    SoLuong = 0;
                                  }
                                });
                              },
                              icon: Icon(Icons.add))
                        ],
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 60,
              ),
              const Row(
                children: [
                  Expanded(
                      child: Text(
                    "Phương Thức Thanh Toán",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  )),
                  Expanded(
                      child: Text(
                    "Thanh Toán khi Nhận Hàng",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20),
                  )),
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Expanded(
                      child: Text(
                    "Điện Thoại",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  )),
                  Expanded(
                      child: Text(
                    "09xxxxxxx",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20),
                  )),
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Expanded(
                      child: Text(
                    "Địa Chỉ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  )),
                  Expanded(
                      child: Text(
                    "Cần Giuộc,Long An,Việt Nam",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20),
                  )),
                ],
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
                height: 20,
              ),
              SizedBox(
                height: 200,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tổng Cộng ",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "đ 46.990.000",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ],
                  )),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Mua Hàng",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(180, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        backgroundColor: Colors.blue),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
