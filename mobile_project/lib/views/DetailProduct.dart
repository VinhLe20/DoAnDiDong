import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/Account.dart';
import 'package:mobile_project/models/Cart.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/views/CartScreen.dart';
import 'package:mobile_project/views/LoginScreen.dart';
import 'package:mobile_project/views/OrderPage.dart';

class DetailProduct extends StatefulWidget {
  DetailProduct({super.key, required this.pro});
  Product pro;
  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  String userPhone = UserProfile.userPhone;
  Future<void> createCart(Cart cart) async {
    try {
      Map<String, dynamic> orderMap = {
        'productName': cart.TenSP,
        //'shopName': cart.Tenshop,
        'userPhone': cart.Sdt,
        'price': cart.GiaSP,
        //'discount': cart.Giamgia,
        'status': cart.Trangthai
      };
      await FirebaseFirestore.instance.collection('carts').add(orderMap);
      print('Đã thêm vào giỏ hàng thành công!');
      Navigator.pop(context);
    } catch (e) {
      print('Thêm vào giỏ hàng thất bại: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: MaterialButton(
              color: Colors.blueGrey,
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 70,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chat),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text('Chat'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                Cart cart = Cart(
                    TenSP: widget.pro.TenSP,
                    GiaSP: widget.pro.GiaSP,
                    Trangthai: true,
                    Sdt: userPhone);
                createCart(cart);
              },
              child: Container(
                alignment: Alignment.center,
                height: 70,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_basket),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text('Thêm giỏ hàng'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              color: Colors.lightBlue,
              onPressed: () {
                if (!Account.isUserLoggedIn) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                } else
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderPage(product: widget.pro),
                    ),
                  );
              },
              child: Container(
                alignment: Alignment.center,
                height: 70,
                child: const Text('Mua ngay'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      widget.pro.Image,
                      height: 215,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: 8.0,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.blueAccent,
                            size: 24.0,
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.pro.TenSP}",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "${widget.pro.GiaSP}",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(
                                width: 2.0,
                              ),
                              Text(
                                '5',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [Text('Đã bán 2,5k')],
                          )
                        ],
                      ),
                      //   Text(widget.pro.)
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Mô tả sản phẩm',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0)),
                                Text(widget.pro.MoTa)
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                // const Text('Đánh giá sản phẩm:',
                //     style:
                //         TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                // Container(
                //   height: 300,
                //   width: 500,
                //   decoration: BoxDecoration(color: Colors.grey),
                //   child: const SingleChildScrollView(
                //     child: Padding(
                //       padding: EdgeInsets.all(8.0),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Card(
                //             elevation: 2.0,
                //             margin: EdgeInsets.symmetric(
                //                 vertical: 8.0, horizontal: 16.0),
                //             child: Padding(
                //               padding: EdgeInsets.all(16.0),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: <Widget>[
                //                   Row(
                //                     children: [
                //                       CircleAvatar(
                //                         backgroundImage: NetworkImage(
                //                             'https://cdn.sforum.vn/sforum/wp-content/uploads/2023/11/avatar-dep-85.jpg'),
                //                         radius: 24.0,
                //                       ),
                //                       SizedBox(
                //                         width: 3.0,
                //                       ),
                //                       Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             'NguyenDinhAnh',
                //                             style: TextStyle(
                //                               fontSize: 18.0,
                //                               fontWeight: FontWeight.bold,
                //                             ),
                //                           ),
                //                           Row(
                //                             children: <Widget>[
                //                               Icon(Icons.star,
                //                                   color: Colors.amber),
                //                               SizedBox(width: 4.0),
                //                               Text(
                //                                 '5',
                //                                 style: TextStyle(
                //                                   fontSize: 16.0,
                //                                   fontWeight: FontWeight.bold,
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                         ],
                //                       ),
                //                     ],
                //                   ),
                //                   SizedBox(height: 8.0),
                //                   Text(
                //                     'Áo đẹp rộng vừa phù hợp mọi lứa tuổi',
                //                     style: TextStyle(fontSize: 16.0),
                //                   ),
                //                   SizedBox(height: 8.0),
                //                   Text('05-01-2024')
                //                 ],
                //               ),
                //             ),
                //           ),
                //           Card(
                //             elevation: 2.0,
                //             margin: EdgeInsets.symmetric(
                //                 vertical: 8.0, horizontal: 16.0),
                //             child: Padding(
                //               padding: EdgeInsets.all(16.0),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: <Widget>[
                //                   Row(
                //                     children: [
                //                       CircleAvatar(
                //                         backgroundImage: NetworkImage(
                //                             'https://cdn.sforum.vn/sforum/wp-content/uploads/2023/11/avatar-dep-85.jpg'),
                //                         radius: 24.0,
                //                       ),
                //                       SizedBox(
                //                         width: 3.0,
                //                       ),
                //                       Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: [
                //                           Text(
                //                             'VinhLe',
                //                             style: TextStyle(
                //                               fontSize: 18.0,
                //                               fontWeight: FontWeight.bold,
                //                             ),
                //                           ),
                //                           Row(
                //                             children: <Widget>[
                //                               Icon(Icons.star,
                //                                   color: Colors.amber),
                //                               SizedBox(width: 4.0),
                //                               Text(
                //                                 '2',
                //                                 style: TextStyle(
                //                                   fontSize: 16.0,
                //                                   fontWeight: FontWeight.bold,
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                         ],
                //                       ),
                //                     ],
                //                   ),
                //                   SizedBox(height: 8.0),
                //                   Text(
                //                     'Áo đẹp không đẹp như quảng cáo',
                //                     style: TextStyle(fontSize: 16.0),
                //                   ),
                //                   SizedBox(height: 8.0),
                //                   Text('02-01-2024')
                //                 ],
                //               ),
                //             ),
                //           ),
                //           Card()
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
