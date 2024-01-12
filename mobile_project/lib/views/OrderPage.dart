import 'package:flutter/material.dart';
import 'package:mobile_project/models/Account.dart';
import 'package:mobile_project/models/product.dart';

class OrderPage extends StatefulWidget {
  final Product product;
  const OrderPage({super.key, required this.product});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int SoLuong = 0;
  @override
  Widget build(BuildContext context) {
    String userPhone = UserProfile.userPhone;
    String userAddress = UserProfile.userAddress;
    return Scaffold(
      appBar: AppBar(
        title: Text("Đặt Hàng"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                      Text(
                        '${widget.product.TenSP.toString()}',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        "đ ${widget.product.GiaSP.toString()}",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                SoLuong--;
                                if (SoLuong < 0) {
                                  SoLuong = 0;
                                }
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            "$SoLuong",
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                SoLuong++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      )
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
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Điện Thoại",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  )),
                  Expanded(
                      child: Text(
                    "${userPhone}",
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
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Địa Chỉ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  )),
                  Expanded(
                      child: Text(
                    "${userAddress}",
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
                  Expanded(
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
                      Text(
                        "giá",
                        // "${(SoLuong *int.parse(widget.product.GiaSP) )}VND",
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
