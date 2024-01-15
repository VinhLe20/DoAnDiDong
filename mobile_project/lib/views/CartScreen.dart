import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/Cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key});
 
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool? isChecked = false;
  List<Cart> carts = List.filled(0, Cart(TenSP: "", GiaSP: "", Sdt: "", Trangthai: false),growable: true);
  void _loadData() {
    Cart.getData("0937569365").then((value) {
      setState(() {
        carts = Cart.carts;
      });
    });
  }
 void all(bool status){
  carts.forEach((element) {
    element.Trangthai = status;
  });
}
  @override
  void initState() {
    super.initState();
    _loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back)),
        title: const Text("Giỏ hàng"),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Icon(Icons.chat_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value;
                          all(value!);                               
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Tất cả sản phẩm"),
                    )
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: carts.length ,
              itemBuilder: (context, index) {
                return Column( 
                  children: [
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: carts[index].Trangthai,
                            onChanged: (bool? value) {
                              setState(() {
                                carts[index].Trangthai = value!;
                              });
                            },
                          ),
                          const Icon(Icons.store),
                          const Text("Tên cửa hàng")
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Checkbox(
                                  value: carts[index].Trangthai,
                              onChanged: (bool? value) {
                                setState(() {
                                   carts[index].Trangthai = value!;
                                });
                              },
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              child: const Placeholder(),
                            ),
                             Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(carts[index].TenSP),
                                  SizedBox(
                                    height: 50.0,
                                  ),
                                  Text("${carts[index].GiaSP}"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.remove),
                                          Text("0"),
                                          Icon(Icons.add),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: const Text("Xóa"),
                            ),
                          ],
                        ))
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Tong cong"), Text("0")],
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  width: 110,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("Mua hàng"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
