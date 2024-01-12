import 'dart:ffi';

class Product {
  String TenSP;
  String GiaSP;
  String Giamgia;
  String MoTa;
  String SoLuong;
  bool Trangthai;
  Product(
      {required this.TenSP,
      required this.GiaSP,
      required this.MoTa,
      required this.SoLuong,
      required this.Giamgia,
      required this.Trangthai});
  Map<String, dynamic> tomap() {
    return {
      "tensp": TenSP,
      "giasp": GiaSP,
      "MoTa": MoTa,
      "SoLuong": SoLuong,
      "TrangThai": Trangthai,
      "GiamGia": Giamgia
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        TenSP: map['tensp'] ?? '',
        GiaSP: map['giasp'] ?? '',
        MoTa: map['MoTa'] ?? '',
        Trangthai: map['TrangThai'] ?? '',
        SoLuong: map['SoLuong'] ?? '',
        Giamgia: map['GiamGia'] ?? '');
  }
}
