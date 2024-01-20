import 'package:flutter/material.dart';
import 'package:mobile_project/models/Order.dart';

class OrderConfirmationPage extends StatefulWidget {
  OrderConfirmationPage({Key? key, required this.tenShop}) : super(key: key);
  final String tenShop;

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  Widget buildOrderConfirmation(Order2 order) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
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
                child: Image.network(
                  order.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.productName,
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Tổng: đ${order.totalAmount}",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: Text("Số lượng: ${order.quantity}")),
                        Expanded(
                          child: TextButton(
                            onPressed: () async {
                              await Order2.Xacnhan(
                                  order.productName, order.nameShop);
                            },
                            child: const Text(
                              "Xác Nhận",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: const Text("Các Đơn Cần Xác Nhận"),
      ),
      body: StreamBuilder<List<Order2>>(
        stream: Order2.load(widget.tenShop),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Order2> orders = snapshot.data ?? [];
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return buildOrderConfirmation(orders[index]);
              },
            );
          }
        },
      ),
    );
  }
}
