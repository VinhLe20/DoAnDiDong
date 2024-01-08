import 'package:flutter/material.dart';

class Quanlytaikhoan extends StatefulWidget {
  const Quanlytaikhoan({super.key});

  @override
  State<Quanlytaikhoan> createState() => _QuanlytaikhoanState();
}

class _QuanlytaikhoanState extends State<Quanlytaikhoan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quản lý tài khoản",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(children: [
          Container(
            // color: Colors.white38,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white, // Màu của hộp
              // borderRadius: BorderRadius.circular(10.0), // Độ cong của góc
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                      0.5), // Màu của bóng (có thể điều chỉnh độ đậm của bóng bằng opacity)
                  spreadRadius: 2.0, // Kích thước mở rộng của bóng
                  blurRadius: 2.0, // Độ mờ của bóng
                  offset: Offset(0, 1), // Độ dịch của bóng theo trục X và Y
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assect/h3.jpg"),
                      radius: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Thanh",
                      style: TextStyle(fontSize: 20),
                    ),
                  ]),
                  Column(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.lock)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                    ],
                  ),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // color: Colors.white38,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white, // Màu của hộp
              // borderRadius: BorderRadius.circular(10.0), // Độ cong của góc
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                      0.5), // Màu của bóng (có thể điều chỉnh độ đậm của bóng bằng opacity)
                  spreadRadius: 2.0, // Kích thước mở rộng của bóng
                  blurRadius: 2.0, // Độ mờ của bóng
                  offset: Offset(0, 1), // Độ dịch của bóng theo trục X và Y
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assect/h3.jpg"),
                      radius: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Vinh",
                      style: TextStyle(fontSize: 20),
                    ),
                  ]),
                  Column(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.lock)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                    ],
                  ),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // color: Colors.white38,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white, // Màu của hộp
              // borderRadius: BorderRadius.circular(10.0), // Độ cong của góc
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                      0.5), // Màu của bóng (có thể điều chỉnh độ đậm của bóng bằng opacity)
                  spreadRadius: 2.0, // Kích thước mở rộng của bóng
                  blurRadius: 2.0, // Độ mờ của bóng
                  offset: Offset(0, 1), // Độ dịch của bóng theo trục X và Y
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assect/h3.jpg"),
                      radius: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Bảo",
                      style: TextStyle(fontSize: 20),
                    ),
                  ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.lock)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                    ],
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
