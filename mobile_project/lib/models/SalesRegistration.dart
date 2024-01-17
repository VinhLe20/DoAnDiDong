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
  
  static Saler saler = Saler(Phone: "", CCCD: "", Diachi: "", Email: "", Tenshop: "");
 static Future<void> getData(String? email) async {
    CollectionReference users = FirebaseFirestore.instance.collection('saler');
    QuerySnapshot querySnapshot = await users.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (email == doc.id) {
        saler = Saler(Phone: data["phone"], CCCD: data["CCCD"], Diachi: data["Diachi"], Email: data["Email"], Tenshop: data["tenshop"]);
      }
    }
  }
}
