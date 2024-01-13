import 'package:flutter/material.dart';
import 'package:mobile_project/models/Account.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  static Account acc = Account("", "", "", false, "");
  void _loadData() {
    Account.getData("0937569365").then((value) {
      setState(() {
        acc = Account.acc;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  SizedBox(
                      width: 100, height: 100, child: Image.network(acc.image)),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(acc.name),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, '/changeProfile');
                          },
                          child: const Text(
                            "Thay đổi thông tin cá nhân",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Đơn hàng của tôi",
                    style: TextStyle(fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text("Xem lịch sử mua hàng"),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: const SizedBox(
                      width: 90,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Icon(Icons.account_balance_wallet),
                          ),
                          Text("Chờ xác nhận")
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const SizedBox(
                      width: 90,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Icon(Icons.local_shipping),
                          ),
                          Text("Đang giao")
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const SizedBox(
                      width: 90,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Icon(Icons.highlight_remove_rounded),
                          ),
                          Text("Đã hủy"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {},
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.store),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(!acc.shop
                              ? "Đăng ký bán hàng"
                              : "Kênh người bán"),
                        )
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: const SizedBox(
                height: 50,
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
            ),
            MaterialButton(
              onPressed: () {},
              child: const SizedBox(
                height: 50,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
