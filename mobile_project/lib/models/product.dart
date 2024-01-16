import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String Image;
  String TenSP;
  String GiaSP;
  String Tenshop;
  String Giamgia;
  String MoTa;
  String? Sdt;
  String SoLuong;
  bool Trangthai;
  String loai;
  Product(
      {required this.TenSP,
      required this.GiaSP,
      required this.Tenshop,
      required this.MoTa,
      required this.SoLuong,
      required this.Giamgia,
      required this.Sdt,
      required this.Trangthai,
      required this.Image,
      required this.loai});
  Map<String, dynamic> tomap() {
    return {
      "tensp": TenSP,
      "giasp": GiaSP,
      "MoTa": MoTa,
      "SoLuong": SoLuong,
      "TrangThai": Trangthai,
      "GiamGia": Giamgia,
      "Sdt": Sdt,
      "Tenshop": Tenshop,
      "Image": Image,
      "loaisp": loai
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        TenSP: map['tensp'] ?? '',
        GiaSP: map['giasp'] ?? '',
        Image: map['Image'] ?? '',
        MoTa: map['MoTa'] ?? '',
        Trangthai: map['TrangThai'] ?? '',
        SoLuong: map['SoLuong'] ?? '',
        Giamgia: map['GiamGia'] ?? '',
        Sdt: map['Sdt'] ?? ' ',
        Tenshop: map['Tenshop'] ?? ' ',
        loai: map['loaisp'] ?? ' ');
  }

  static List<Product> products = List.filled(
      0,
      Product(
          TenSP: "",
          GiaSP: "",
          Tenshop: "",
          MoTa: "",
          SoLuong: "",
          Giamgia: "",
          Sdt: "",
          Trangthai: true,
          Image: "",
          loai: ""),
      growable: true);

  static Future<void> getData(String tenshop) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('product');
    QuerySnapshot querySnapshot = await users.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (data["Tenshop"] == tenshop) {
        Product product = Product(
            TenSP: data["tensp"],
            GiaSP: data["giasp"],
            Tenshop: data["Tenshop"],
            MoTa: data["MoTa"],
            SoLuong: data["SoLuong"],
            Giamgia: data["GiamGia"],
            Sdt: data["Sdt"],
            Trangthai: data["TrangThai"],
            Image: data["Image"],
            loai: data["loaisơ"]);
        products.add(product);
      }
    }
  }
}
