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
        title: const Text(
          "Quản lý tài khoản",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(children: [
          Container(
            
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white, 
              
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                      0.5), 
                  spreadRadius: 2.0, 
                  blurRadius: 2.0, 
                  offset: const Offset(0, 1), 
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(children: [
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
                      IconButton(onPressed: () {}, icon: const Icon(Icons.lock)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                    ],
                  ),
                ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white, 
              
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                      0.5), 
                  spreadRadius: 2.0, 
                  blurRadius: 2.0, 
                  offset: const Offset(0, 1), 
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(children: [
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
                      IconButton(onPressed: () {}, icon: const Icon(Icons.lock)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                    ],
                  ),
                ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white, 
              
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                      0.5), 
                  spreadRadius: 2.0, 
                  blurRadius: 2.0, 
                  offset: const Offset(0, 1), 
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(children: [
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
                      IconButton(onPressed: () {}, icon: const Icon(Icons.lock)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                    ],
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
