import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tài khoản"),
        actions: const [
          Icon(Icons.shopping_cart),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Icon(Icons.chat_outlined),
          )
        ],
      ),
      body: const Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 35,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("UserName"),
                      SizedBox(height: 10),
                      Text("Thay đổi thông tin cá nhân")
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Đơn hàng của tôi",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    Text("Xem lịch sử mua hàng"),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.account_balance_wallet),
                    Text("Chờ xác nhận")
                  ],
                ),
                Column(
                  children: [Icon(Icons.local_shipping), Text("Đang giao")],
                ),
                Column(
                  children: [
                    Icon(Icons.highlight_remove_rounded),
                    Text("Đã hủy"),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.store),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Đăng ký bán hàng"),
                    )
                  ],
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.logout),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Đăng nhập"),
                    )
                  ],
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.logout),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Đăng xuất"),
                    )
                  ],
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          )
        ],
      ),
    );
  }
}
