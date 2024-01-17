import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  String TenSP;
  //String Tenshop;
  String GiaSP;
  //int Giamgia;
  String? Sdt;
  bool Trangthai;
  Cart(
      {required this.TenSP,
      required this.GiaSP,
      //required this.Tenshop,
      //required this.Giamgia,
      required this.Sdt,
      required this.Trangthai});
  Map<String, dynamic> tomap() {
    return {
      "tensp": TenSP,
      "giasp": GiaSP,
      //"tenshop": Tenshop,
      "TrangThai": Trangthai,
      //"GiamGia": Giamgia,
      "Sdt": Sdt
    };
  }
  static List<Cart> carts = List.filled(0, Cart(TenSP: "", GiaSP: "", Sdt: "", Trangthai: false),growable: true);
  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
        TenSP: map['tensp'] ?? '',
        //Tenshop: map['tenshop'] ?? '',
        GiaSP: map['giasp'] ?? '',
        Trangthai: map['TrangThai'] ?? '',
        //Giamgia: map['GiamGia'] ?? '',
        Sdt: map['Sdt'] ?? ' ');
  }
   static Future<void> getData(String phone) async {
    CollectionReference users = FirebaseFirestore.instance.collection('carts');
    QuerySnapshot querySnapshot = await users.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (phone == data["userPhone"]) {
       Cart cart = Cart(TenSP: data["productName"], GiaSP: data["price"], Sdt: data["userPhone"], Trangthai: data["status"]);
       carts.add(cart);
      }
    }
  }
}
