import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/Account.dart';
import 'package:mobile_project/views/CartScreen.dart';
import 'package:mobile_project/views/LoginScreen.dart';
import 'package:mobile_project/views/MainScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_project/views/Profile.dart';
import 'package:mobile_project/views/SalesRegistration.dart';
import 'package:mobile_project/views/ShopManager.dart';
import 'package:mobile_project/views/donhangcuatoi.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String name = "";
  String address = "";
  String phone = "";
  String email = "";
  bool shop = false;

  static Account acc = Account("", "", "", "", false, "");
  User? user = FirebaseAuth.instance.currentUser;
  void _loadData() {
    Account.getData(user?.email).then((value) {
      setState(() {
        acc = Account.acc;
      });
    });
    saveUser();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void saveUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', acc.name);
    prefs.setString('email', acc.email);
    prefs.setString('phone', acc.phone);
    prefs.setString('address', acc.adress);
    prefs.setBool('shop', acc.shop);
  }

  void loadUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString('name') ?? "";
    email = prefs.getString('email') ?? "";
    phone = prefs.getString('phone') ?? "";
    address = prefs.getString('address') ?? "";
    shop = prefs.getBool('shop') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    if (name == "") {
      setState(() {
        name = acc.name;
        email = acc.email;
        phone = acc.phone;
        address = acc.adress;
        shop = acc.shop;
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: const Text("Tài khoản"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
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
                    width: 90.0,
                    height: 90.0,
                    child: ClipOval(
                      child: Image.network(
                        acc.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Profile(),
                              ),
                            );
                            if (result) {
                              _loadData();
                            }
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => donhangcuatoi(
                            initialIndex: 2,
                          ),
                        ),
                      );
                    },
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => donhangcuatoi(
                            initialIndex: 0,
                          ),
                        ),
                      );
                    },
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => donhangcuatoi(
                            initialIndex: 1,
                          ),
                        ),
                      );
                    },
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => donhangcuatoi(
                            initialIndex: 3,
                          ),
                        ),
                      );
                    },
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
              onPressed: () async {
                bool manager = shop;
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => manager
                            ? const ShopsManager()
                            : const SalesRegistration())));
                if (result) {
                  setState(() {
                    _loadData();
                  });
                }
              },
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
                          child: Text(
                              shop ? "Kênh người bán" : "Đăng ký bán hàng"),
                        )
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                bool xacnhan = false;
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Đăng xuất'),
                      content: Text('Nhấn OK để đăng xuất khỏi tài khoản'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            xacnhan = true;
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
                if (xacnhan) {
                  await FirebaseAuth.instance.signOut();
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.clear();
                  Account.isUserLoggedIn = false;
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                  if (result) {
                    Navigator.pushReplacementNamed(context, '/');
                  }
                }
              },
              child: const SizedBox(
                height: 50,
                child: SizedBox(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
