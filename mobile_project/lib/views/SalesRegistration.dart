import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/SalesRegistration.dart';

class SalesRegistration extends StatefulWidget {
  const SalesRegistration({super.key});

  @override
  State<SalesRegistration> createState() => _SalesRegistrationState();
}

class _SalesRegistrationState extends State<SalesRegistration> {
  final TextEditingController _Tenshop = TextEditingController();
  final TextEditingController _CCCD = TextEditingController();
  final TextEditingController _Email = TextEditingController();
  final TextEditingController _Phone = TextEditingController();
  final TextEditingController _Diachi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông Tin Shop"),
        leading: Icon(Icons.arrow_back_outlined),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(8),
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
                Expanded(
                  child: Text(
                    "7/10",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.right,
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
                prefixIcon: Icon(Icons.shopping_cart),
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
                prefixIcon: Icon(Icons.card_giftcard_outlined),
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
                prefixIcon: Icon(Icons.email_outlined),
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
                prefixIcon: Icon(Icons.phone),
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
                prefixIcon: Icon(Icons.location_on),
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
                }
              },
              child: Text(
                "Lưu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20.0),
                  minimumSize: Size(400.0, 50.0),
                  backgroundColor: Colors.blue),
            )
          ],
        ),
      )),
    );
  }

  Future<void> addSaler(Saler saler) async {
    try {
      await FirebaseFirestore.instance
          .collection('saler')
          .doc(saler.Phone)
          .set(saler.tomap());
    } catch (e) {
      print('Error adding profile to Firestore: $e');
    }
  }

  void saveSaler(
      //String tenshop, String cccd, String phone, String diachi, String Email
      ) {
    Saler saler = Saler(
        Tenshop: _Tenshop.text,
        CCCD: _CCCD.text,
        Phone: _Phone.text,
        Email: _Email.text,
        Diachi: _Diachi.text);
    addSaler(saler);
  }
}
