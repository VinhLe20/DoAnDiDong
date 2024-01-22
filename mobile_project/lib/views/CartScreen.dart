import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/CartProduct.dart';
import 'package:mobile_project/views/DetailProduct.dart';

import '../models/Order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

// CartProduct? cartpro;
class _CartScreenState extends State<CartScreen> {
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  String? fileName;
  User? user = FirebaseAuth.instance.currentUser;
  Stream<List<CartProduct>> streamData(String? email) {
    CollectionReference orders =
        FirebaseFirestore.instance.collection('CartProduct');
    return orders
        .where('email', isEqualTo: user?.email)
        .where('xoa', isEqualTo: true)
        .snapshots()
        .map(
          (QuerySnapshot querySnapshot) => querySnapshot.docs
              .map(
                (QueryDocumentSnapshot document) => CartProduct(
                    GiaSP: document["giasp"],
                    xoa: document["xoa"],
                    Giamgia: document["GiamGia"],
                    SoLuong: document["SoLuong"],
                    TenSP: document["tensp"],
                    Tenshop: document["tenshop"],
                    Trangthai: document["TrangThai"],
                    email: document["email"],
                    img: document['img']),
              )
              .toList(),
        );
  }

  Future<void> createOrder(Order2 order) async {
    try {
      Map<String, dynamic> orderMap = {
        'image': order.image,
        'productName': order.productName,
        'quantity': order.quantity,
        'email': user?.email,
        'userAddress': order.userAddress,
        'totalAmount': order.totalAmount,
        'status': "Chờ xác nhận",
        'nameShop': order.nameShop,
      };
      await FirebaseFirestore.instance.collection('orders').add(orderMap);
      print('Đơn hàng đã được tạo thành công!');
      // Navigator.pop(context);
    } catch (e) {
      print('Lỗi khi tạo đơn hàng: $e');
    }
  }

  var image;
  var productname;
  var soluong;
  var tongtiendon;
  var tenshop;

  //UserProfile userProfile = UserProfile();
  var tongtien = 0;
  //bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    User? email = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
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
          //
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Tất cả sản phẩm"),

                      ///   Text()
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {
                      updatetatcaxoa2(false);
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
          ),
          Expanded(
              child: InkWell(
            child: StreamBuilder<List<CartProduct>>(
              stream: streamData(email?.email),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<CartProduct> cartproduct = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: cartproduct.length,
                    itemBuilder: (context, index) {
                      int gia = cartproduct[index].Giamgia == 0
                          ? cartproduct[index].GiaSP
                          : cartproduct[index].Giamgia;
                      soluong = cartproduct[index].SoLuong;
                      productname = cartproduct[index].Tenshop;
                      tongtiendon = cartproduct[index].SoLuong * gia;
                      tenshop = cartproduct[index].Tenshop;
                      image = cartproduct[index].img;

                      return Card(
                        child: Column(
                          children: [
                            const Divider(),
                            Row(
                              children: [
                                const Icon(Icons.store),
                                Text(cartproduct[index].Tenshop)
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: cartproduct[index].Trangthai,
                                      onChanged: (bool? value) async {
                                        await updatetrangthai(
                                            cartproduct[index].TenSP, value!);
                                        if (value == false) {
                                          setState(() {
                                            tongtien -=
                                                cartproduct[index].SoLuong *
                                                    gia;
                                          });
                                        } else {
                                          setState(() {
                                            tongtien +=
                                                cartproduct[index].SoLuong *
                                                    gia;
                                          });
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.network(
                                        cartproduct[index].img,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    // Padding(
                                    // padding: EdgeInsets.all(10.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 50.0,
                                        ),
                                        Text('$gia'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.remove),
                                                  onPressed: () {
                                                    if (cartproduct[index]
                                                                .SoLuong -
                                                            1 ==
                                                        0) {
                                                      return;
                                                    }
                                                    updatesoluong(
                                                        cartproduct[index]
                                                            .TenSP,
                                                        cartproduct[index]
                                                                .SoLuong =
                                                            cartproduct[index]
                                                                    .SoLuong -
                                                                1);
                                                    if (cartproduct[index]
                                                                .Trangthai ==
                                                            true &&
                                                        cartproduct[index]
                                                                .SoLuong >
                                                            0) {
                                                      setState(() {
                                                        tongtien -= gia;
                                                      });
                                                    }
                                                  },
                                                ),
                                                Text(
                                                    '${cartproduct[index].SoLuong}'),
                                                IconButton(
                                                  icon: const Icon(Icons.add),
                                                  onPressed: () {
                                                    updatesoluong(
                                                        cartproduct[index]
                                                            .TenSP,
                                                        cartproduct[index]
                                                                .SoLuong =
                                                            cartproduct[index]
                                                                    .SoLuong +
                                                                1);
                                                    if (cartproduct[index]
                                                            .Trangthai ==
                                                        true) {
                                                      setState(() {
                                                        tongtien += gia;
                                                      });
                                                    }
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
                                        xoaCartProduct(email?.email,
                                            cartproduct[index].TenSP, false);
                                        _showSnackBar("Bạn đã xóa thành công");
                                      },
                                      child: const Text("Xóa"),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [const Text("Tong cong"), Text("$tongtien")],
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.blue),
                  width: 110,
                  height: 50,
                  alignment: Alignment.center,
                  child: TextButton(
                    child: const Text("Mua hàng"),
                    onPressed: () {
                      _showSnackBar("Bạn đã mua hàng thành công");
                      Order2 order2 = Order2(Tensp, soluong, '', '',
                          tongtiendon, 'Chờ xác nhận', image, tenshop);
                      createOrder(order2);
                      updatetatcaxoa(true, false);

                      setState(() {
                        tongtien = 0;
                      });
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future<void> xoaCartProduct(String? email, String Tensp, bool trangthai) async {
  Map<String, dynamic> dataToUpdate;
  CollectionReference cartproduct =
      FirebaseFirestore.instance.collection('CartProduct');
  QuerySnapshot querySnapshot = await cartproduct.get();
  querySnapshot.docs.forEach((doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    {
      if (Tensp == data["tensp"] && email == data["email"]) {
        CollectionReference collection =
            FirebaseFirestore.instance.collection('CartProduct');
        DocumentReference document = collection.doc(doc.id);
        if (trangthai == true) {
          dataToUpdate = {'xoa': trangthai};
        } else {
          dataToUpdate = {'xoa': trangthai};
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
        if (Soluong >= 0) {
          dataToUpdate = {'SoLuong': Soluong};
        } else {
          dataToUpdate = {};
        }
        try {
          await document.update(dataToUpdate);
        } catch (e) {}
      }
    }
  });
}

Future<void> updatetrangthai(String Tensp, bool trangthai) async {
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
        if (trangthai == false) {
          dataToUpdate = {'TrangThai': trangthai};
        } else {
          dataToUpdate = {'TrangThai': trangthai};
        }
        try {
          await document.update(dataToUpdate);
        } catch (e) {}
      }
    }
  });
}

Future<void> updatetatcatrangthai(bool trangthai) async {
  Map<String, dynamic> dataToUpdate;
  CollectionReference cartproduct =
      FirebaseFirestore.instance.collection('CartProduct');
  QuerySnapshot querySnapshot = await cartproduct.get();
  querySnapshot.docs.forEach((doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    {
      CollectionReference collection =
          FirebaseFirestore.instance.collection('CartProduct');
      DocumentReference document = collection.doc(doc.id);
      if (trangthai == true) {
        dataToUpdate = {
          'TrangThai': trangthai,
        };
      } else {
        dataToUpdate = {
          'TrangThai': trangthai,
        };
      }
      try {
        await document.update(dataToUpdate);
      } catch (e) {}
    }
//    }
  });
}

Future<void> updatetatcaxoa(bool trangthai, bool xoa) async {
  Map<String, dynamic> dataToUpdate;
  CollectionReference cartproduct =
      FirebaseFirestore.instance.collection('CartProduct');
  QuerySnapshot querySnapshot = await cartproduct.get();
  querySnapshot.docs.forEach((doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    {
      if (trangthai == data["TrangThai"]) {
        CollectionReference collection =
            FirebaseFirestore.instance.collection('CartProduct');
        DocumentReference document = collection.doc(doc.id);
        if (trangthai == true) {
          dataToUpdate = {'TrangThai': trangthai, 'xoa': xoa};
        } else {
          dataToUpdate = {'TrangThai': trangthai, 'xoa': xoa};
        }
        try {
          await document.update(dataToUpdate);
        } catch (e) {}
      }
    }
//    }
  });
}

Future<void> updatetatcaxoa2(bool xoa) async {
  Map<String, dynamic> dataToUpdate;
  CollectionReference cartproduct =
      FirebaseFirestore.instance.collection('CartProduct');
  QuerySnapshot querySnapshot = await cartproduct.get();
  querySnapshot.docs.forEach((doc) async {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    {
      CollectionReference collection =
          FirebaseFirestore.instance.collection('CartProduct');
      DocumentReference document = collection.doc(doc.id);
      if (xoa == true) {
        dataToUpdate = {'xoa': xoa};
      } else {
        dataToUpdate = {'xoa': xoa};
      }
      try {
        await document.update(dataToUpdate);
      } catch (e) {}
    }
//    }
  });
}
