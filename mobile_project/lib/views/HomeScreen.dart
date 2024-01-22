import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/Account.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/views/CartScreen.dart';
import 'package:mobile_project/views/DetailProduct.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Product>> getProducts(List<Product> productList) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('product').get();

  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    Product product = Product.fromMap(data);
    if (product.Trangthai == true) {
      productList.add(product);
    }
  }
  await saveProductsToLocal(productList);
  return productList;
}

Future<void> saveProductsToLocal(List<Product> products) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> productsJsonList =
      products.map((product) => product.toJson().toString()).toList();
  await prefs.setStringList('local_products', productsJsonList);
}

Future<List<Product>> getLocalProducts() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? productsJsonList = prefs.getStringList('local_products');
  if (productsJsonList != null) {
    List<Product> localProducts = productsJsonList
        .map((productJson) => Product.fromJson(productJson))
        .toList();
    return localProducts;
  } else {
    return [];
  }
}

//1
List<Product> products = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imagelist = [
    "assets/hinhtet.jpg",
    "assets/thanhshop.jpg",
    "assets/dangky.jpg",
    "assets/Giangmaishop.jpg",
    "assets/salebao.jpg",
    "assets/hinhslogan.jpg",
  ];
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    products.clear();
    futureProducts = getProducts([]);
  }

  //String userPhone = UserProfile.userPhone;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () async {
                  bool hasNetwork = await checkNetwork();

                  if (!hasNetwork) {
                    // Nếu không có mạng, sử dụng dữ liệu cục bộ
                    List<Product> localProducts = await getLocalProducts();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    );
                  }
                  updatetatcatrangthai(false);
                },
              ),
              IconButton(
                icon: const Icon(Icons.chat_sharp),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    viewportFraction: 1.0,
                  ),
                  items: imagelist.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: FutureBuilder<List<Product>>(
                  future: futureProducts,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Đã xảy ra lỗi: ${snapshot.error}');
                    } else {
                      List<Product> products = snapshot.data ?? [];
                      bool hasNetwork =
                          snapshot.connectionState == ConnectionState.done;

                      if (!hasNetwork) {
                        getLocalProducts().then((localProducts) {
                          products = localProducts;
                        });
                      }
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: products.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailProduct(
                                      pro: products[index],
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 7.0, //
                                child: ListTile(
                                    subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                            products[index].Image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      ' ${products[index].TenSP.toString()}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    products[index].Giamgia.toString() != "0"
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                                Text(
                                                  ' ${products[index].GiaSP.toString()} VND',
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                                Text(
                                                  ' ${products[index].Giamgia.toString()} VND',
                                                  style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ])
                                        : Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                ' ${products[index].GiaSP.toString()} VND',
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                )),
                              ));
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> checkNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Kết quả tìm kiếm cho: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Gợi ý tìm kiếm'),
    );
  }
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
      if (trangthai == true)
        dataToUpdate = {
          'TrangThai': trangthai,
        };
      else {
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
