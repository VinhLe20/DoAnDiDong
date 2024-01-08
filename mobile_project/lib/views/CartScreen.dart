import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
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
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                          ),
                          const Icon(Icons.store),
                          const Text("Ten cua hang")
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              child: const Placeholder(),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ten sp"),
                                  SizedBox(
                                    height: 50.0,
                                  ),
                                  Text("đơn giá"),
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
