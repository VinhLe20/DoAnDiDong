import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imagelist = [
    "assets/h1.jpg",
    "assets/h2.jpg",
    "assets/h1.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.2,
              padding: EdgeInsets.fromLTRB(0, 0, 230, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(
                          context: context, delegate: CustomSearchDelegate());
                    },
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // enlargeFactor: 0.3,
                  // scrollDirection: Axis.horizontal,
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
              height: 50,
            ),
            const Text("Sản phẩm giảm giá"),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                color: Colors.grey[300],
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/h2.jpg",
                        height: 130,
                        width: 130,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Điện thoại Iphone 15 promax 1TB",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "50.000.000 VND",
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "45.000.000 VND",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  "đã bán 20",
                                  style: TextStyle(fontSize: 10),
                                )
                              ])
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //   Padding(padding: EdgeInsets.all(10)),
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                color: Colors.grey[300],
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/h1.jpg",
                        height: 130,
                        width: 130,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Điện thoại Iphone 15 promax 1TB",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "50.000.000 VND",
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "45.000.000 VND",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  "đã bán 20",
                                  style: TextStyle(fontSize: 10),
                                )
                              ])
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                color: Colors.grey[300],
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/h2.jpg",
                        height: 130,
                        width: 130,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Điện thoại Iphone 15 promax 1TB",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "50.000.000 VND",
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "45.000.000 VND",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  "đã bán 20",
                                  style: TextStyle(fontSize: 10),
                                )
                              ])
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //   Padding(padding: EdgeInsets.all(10)),
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                color: Colors.grey[300],
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/h1.jpg",
                        height: 130,
                        width: 130,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Điện thoại Iphone 15 promax 1TB",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "50.000.000 VND",
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "45.000.000 VND",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  "đã bán 20",
                                  style: TextStyle(fontSize: 10),
                                )
                              ])
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
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
    // Xử lý kết quả tìm kiếm và hiển thị
    return Center(
      child: Text('Kết quả tìm kiếm cho: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Gợi ý khi người dùng bắt đầu nhập
    return const Center(
      child: Text('Gợi ý tìm kiếm'),
    );
  }
}
