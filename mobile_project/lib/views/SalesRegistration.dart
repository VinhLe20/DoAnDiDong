import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/SalesRegistration.dart';

class SalesRegistration extends StatefulWidget {
  const SalesRegistration({super.key});

  @override
  State<SalesRegistration> createState() => _SalesRegistrationState();
}

class _SalesRegistrationState extends State<SalesRegistration> {
  final User? _user = FirebaseAuth.instance.currentUser;
  Future<void> addSaler(Saler saler) async {
    try {
      await FirebaseFirestore.instance
          .collection('saler')
          .doc(_user?.email)
          .set(saler.tomap());
    } catch (e) {
      print('Error adding profile to Firestore: $e');
    }
  }

  void saveSaler() {
    Saler saler = Saler(
        Tenshop: _Tenshop.text,
        CCCD: _CCCD.text,
        Phone: _Phone.text,
        Email: _Email.text,
        Diachi: _Diachi.text);
    addSaler(saler);
  }

  final TextEditingController _Tenshop = TextEditingController();
  final TextEditingController _CCCD = TextEditingController();
  final TextEditingController _Email = TextEditingController();
  final TextEditingController _Phone = TextEditingController();
  final TextEditingController _Diachi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: const Text("Thông Tin Shop"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Tên Shop",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _Tenshop,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: const Icon(Icons.shopping_cart),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Căn Cước Công Dân (CCCD)",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _CCCD,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: const Icon(Icons.card_giftcard_outlined),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _Email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: const Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Số Điện Thoại",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _Phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: const Icon(Icons.phone),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Địa Chỉ Lấy Hàng",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _Diachi,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: const Icon(Icons.location_on),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (_Tenshop.text.isEmpty ||
                    _CCCD.text.isEmpty ||
                    _Diachi.text.isEmpty ||
                    _Email.text.isEmpty ||
                    _Phone.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Vui lòng nhập đầy đủ thông tin'),
                          icon: const Icon(
                            Icons.warning,
                            color: Colors.yellow,
                            size: 50,
                          ),
                          actions: [
                            SizedBox(
                              width: 300,
                              height: 50,
                              child: FloatingActionButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                backgroundColor: Colors.blue,
                                child: const Text(
                                  "Ok",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        );
                      });
                } else {
                  saveSaler();
                  updateAccount();
                }
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  minimumSize: const Size(400.0, 50.0),
                  backgroundColor: Colors.lightBlue[200]),
              child: const Text(
                "Lưu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<void> updateAccount() async {
    Map<String, dynamic> dataToUpdate;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentReference document = users.doc(_user?.email);
    dataToUpdate = {'Shop': true};
    try {
      await document.update(dataToUpdate);
    } catch (e) {}
  }
}
