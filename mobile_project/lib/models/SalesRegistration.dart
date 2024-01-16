import 'package:cloud_firestore/cloud_firestore.dart';

class Saler {
  String Phone;
  String Tenshop;
  String CCCD;
  String Email;
  String Diachi;
  Saler(
      {required this.Phone,
      required this.CCCD,
      required this.Diachi,
      required this.Email,
      required this.Tenshop});
  Map<String, dynamic> tomap() {
    return {
      "phone": Phone,
      "tenshop": Tenshop,
      "Email": Email,
      "Diachi": Diachi,
      "CCCD": CCCD,
    };
  }
}
