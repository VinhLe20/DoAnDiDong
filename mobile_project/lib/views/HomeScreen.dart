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
      //bottomNavigationBar: BottomNavigator(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(0, 0, 230, 0),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
              ),
              color: Colors.grey[350],
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.chat_sharp),
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
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // enlargeFactor: 0.3,
                  // scrollDirection: Axis.horizontal,
                ),
                items: imagelist.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
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
            SizedBox(
              height: 50,
            ),
            Text("Sản phẩm giảm giá"),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                color: Colors.grey[300],
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  child: Column(
                    children: [
                      Image.asset(
                        "assect/h2.jpg",
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
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  child: Column(
                    children: [
                      Image.asset(
                        "assect/h1.jpg",
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
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                color: Colors.grey[300],
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  child: Column(
                    children: [
                      Image.asset(
                        "assect/h2.jpg",
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
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  child: Column(
                    children: [
                      Image.asset(
                        "assect/h1.jpg",
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
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
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
    return Center(
      child: Text('Gợi ý tìm kiếm'),
    );
  }
}
