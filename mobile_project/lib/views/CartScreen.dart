import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/CartProduct.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/views/DetailProduct.dart';

Future<List<CartProduct>> getCartProducts() async {
  List<CartProduct> cartProducts = [];
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('CartProduct').get();

  querySnapshot.docs.forEach((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    CartProduct cartProduct = CartProduct.fromMap(data);
    if (cartProduct.Trangthai == true) {
      cartProducts.add(cartProduct);
    }
  });

  return cartProducts;
}

class CartScreen extends StatefulWidget {
  CartScreen({Key? key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

// CartProduct? cartpro;
class _CartScreenState extends State<CartScreen> {
  late Future<List<CartProduct>> futureCartProducts;
  @override
  void initState() {
    super.initState();

    futureCartProducts = getCartProducts();
  }

  bool? isChecked = false;
  // late Future<List<CartProduct>> futureProducts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
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
                          // all(value!);
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Tất cả sản phẩm"),

                      ///   Text()
                    )
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
              ],
            ),
          ),
          Expanded(
              child: InkWell(
                  child: FutureBuilder<List<CartProduct>>(
                      future: futureCartProducts,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Đã xảy ra lỗi: ${snapshot.error}');
                        } else {
                          List<CartProduct> cartproduct = snapshot.data ?? [];
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: cartproduct.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  subtitle: Column(
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
                                              SizedBox(
                                                width: 10,
                                              ),
                                              // Padding(
                                              // padding: EdgeInsets.all(10.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      cartproduct[index].TenSP),
                                                  SizedBox(
                                                    height: 50.0,
                                                  ),
                                                  Text(
                                                      '${cartproduct[index].GiaSP}'),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                            icon: Icon(
                                                                Icons.remove),
                                                            onPressed: () {
                                                              updatesoluong(
                                                                  cartproduct[
                                                                          index]
                                                                      .TenSP,
                                                                  cartproduct[
                                                                          index]
                                                                      .SoLuong = cartproduct[
                                                                              index]
                                                                          .SoLuong -
                                                                      1);
                                                            },
                                                          ),
                                                          Text(
                                                              '${cartproduct[index].SoLuong}'),
                                                          IconButton(
                                                            icon:
                                                                Icon(Icons.add),
                                                            onPressed: () {
                                                              updatesoluong(
                                                                  cartproduct[
                                                                          index]
                                                                      .TenSP,
                                                                  cartproduct[
                                                                          index]
                                                                      .SoLuong = cartproduct[
                                                                              index]
                                                                          .SoLuong +
                                                                      1);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              //  ),
                                              const Spacer(),
                                              TextButton(
                                                // padding:
                                                ///   const EdgeInsets.all(10.0),
                                                onPressed: () {
                                                  xoaCartProduct(
                                                      cartproduct[index].TenSP,
                                                      false);
                                                },
                                                child: Text("Xóa"),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }))),
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

Future<void> xoaCartProduct(String Tensp, bool trangthai) async {
  Map<String, dynamic> dataToUpdate;
  CollectionReference cartproduct =
      FirebaseFirestore.instance.collection('CartProduct');
  QuerySnapshot querySnapshot = await cartproduct.get();
  querySnapshot.docs.forEach((doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    {
      if (Tensp == data["tensp"]) {
        CollectionReference collection =
            FirebaseFirestore.instance.collection('CartProduct');
        DocumentReference document = collection.doc(doc.id);
        if (trangthai == true)
          dataToUpdate = {'TrangThai': trangthai};
        else {
          dataToUpdate = {'TrangThai': trangthai};
        }
        try {
          await document.update(dataToUpdate);
        } catch (e) {}
      }
    }
  });
}

Future<void> updatesoluong(String Tensp, int Soluong) async {
  Map<String, dynamic> dataToUpdate;
  CollectionReference cartproduct =
      FirebaseFirestore.instance.collection('CartProduct');
  QuerySnapshot querySnapshot = await cartproduct.get();
  querySnapshot.docs.forEach((doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    {
      if (Tensp == data["tensp"]) {
        CollectionReference collection =
            FirebaseFirestore.instance.collection('CartProduct');
        DocumentReference document = collection.doc(doc.id);
        if (Soluong >= 0)
          dataToUpdate = {'SoLuong': Soluong};
        else {
          dataToUpdate = {};
        }
        try {
          await document.update(dataToUpdate);
        } catch (e) {}
      }
    }
  });
}
