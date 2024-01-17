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
        title: const Text("Các Đơn Cần Xác Nhận"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                    child: Image.asset(
                  "assets/Logo.jpg",
                  fit: BoxFit.cover,
                )),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text("Nguyễn Đình Anh"),
              const SizedBox(
                width: 50,
              ),
              const Text(
                "Chờ Xác Nhận",
                style: TextStyle(fontSize: 20, color: Colors.red),
                textAlign: TextAlign.right,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
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
                      const Expanded(child: Text("Số Lượng : 1")),
                      Expanded(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
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
