import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/Account.dart';
import 'package:mobile_project/models/Order.dart';

class donhangcuatoi extends StatefulWidget {
  donhangcuatoi({super.key, required this.initialIndex});
  int initialIndex;
  @override
  State<donhangcuatoi> createState() => _donhangcuatoiState();
}

class _donhangcuatoiState extends State<donhangcuatoi> {
  User? user = FirebaseAuth.instance.currentUser;
  var binhluan = TextEditingController();
  ChoXacNhan(String image, String name, int total, int quantity, String status,
      String nameShop) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.store),
                SizedBox(
                  width: 5,
                ),
                Text(nameShop),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Chờ Xác Nhận",
              style: TextStyle(fontSize: 20, color: Colors.red),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            height: 130,
            child: Image.network(image, fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "đ $total",
                style: const TextStyle(color: Colors.red, fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: Text("Số Lượng : $quantity")),
                  Expanded(
                    child: TextButton(
                        onPressed: () async {
                          await Order2.Huy(user?.email, name, nameShop);
                        },
                        child: const Text(
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

  DangGiao(String image, String name, int total, int quantity, String status,
      String nameShop) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.store),
                SizedBox(
                  width: 5,
                ),
                Text(nameShop),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Đang giao",
              style: TextStyle(fontSize: 20, color: Colors.red),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            height: 130,
            child: Image.network(image, fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 8,
          ),
          //
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "đ $total",
                style: const TextStyle(color: Colors.red, fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("Số Lượng : $quantity")),
                  Expanded(
                    child: TextButton(
                        onPressed: () async {
                          await Order2.DaNhan(user?.email, name, nameShop);
                        },
                        child: const Text(
                          "Đã nhận hàng",
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

  DaGiao(String image, String name, int total, int quantity, String status,
      String nameShop) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.store),
                SizedBox(
                  width: 5,
                ),
                Text(nameShop),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Đã giao",
              style: TextStyle(fontSize: 20, color: Colors.red),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            height: 130,
            child: Image.network(image, fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "đ $total",
                style: const TextStyle(color: Colors.red, fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("Số Lượng : $quantity")),
                  Expanded(
                    child: TextButton(
                        onPressed: () async {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Bình luận'),
                                content: TextField(
                                  controller: binhluan,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    hintText: "Bình luận",
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      DateTime now = DateTime.now();
                                      String time =
                                          '${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}:${now.second}';
                                      Account.addBinhLuan(user?.email, name,
                                          nameShop, binhluan.text, time);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Bình luận",
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

  Huy(String image, String name, int total, int quantity, String status,
      String nameShop) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.store),
                SizedBox(
                  width: 5,
                ),
                Text(nameShop),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Đã hủy",
              style: TextStyle(fontSize: 20, color: Colors.red),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            height: 130,
            child: Image.network(image, fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 55,
              ),
              Text(
                "đ $total",
                style: const TextStyle(color: Colors.red, fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: Text("Số Lượng : $quantity")),
                ],
              ),
            ],
          ))
        ],
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initialIndex,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[200],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text(
            "Đơn hàng của tôi",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          bottom: const TabBar(
              labelColor: Colors.red, // Màu của tab được chọn
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.red,
              tabs: [
                Tab(child: Text("Chờ xác nhận")),
                Tab(
                  child: Text("Chờ giao hàng"),
                ),
                Tab(
                  child: Text("Đã giao"),
                ),
                Tab(
                  child: Text("Đã hủy"),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            StreamBuilder<List<Order2>>(
              stream: Order2.streamData(user?.email, "Chờ xác nhận"),
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
                      return ChoXacNhan(
                        orders[index].image,
                        orders[index].productName,
                        orders[index].totalAmount,
                        orders[index].quantity,
                        orders[index].status,
                        orders[index].nameShop,
                      );
                    },
                  );
                }
              },
            ),
            StreamBuilder<List<Order2>>(
              stream: Order2.streamData(user?.email, "Đang giao hàng"),
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
                      return DangGiao(
                        orders[index].image,
                        orders[index].productName,
                        orders[index].totalAmount,
                        orders[index].quantity,
                        orders[index].status,
                        orders[index].nameShop,
                      );
                    },
                  );
                }
              },
            ),
            StreamBuilder<List<Order2>>(
              stream: Order2.streamData(user?.email, "Đã giao"),
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
                      return DaGiao(
                        orders[index].image,
                        orders[index].productName,
                        orders[index].totalAmount,
                        orders[index].quantity,
                        orders[index].status,
                        orders[index].nameShop,
                      );
                    },
                  );
                }
              },
            ),
            StreamBuilder<List<Order2>>(
              stream: Order2.streamData(user?.email, "Đã hủy"),
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
                      return Huy(
                        orders[index].image,
                        orders[index].productName,
                        orders[index].totalAmount,
                        orders[index].quantity,
                        orders[index].status,
                        orders[index].nameShop,
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
