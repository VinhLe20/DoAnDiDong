class Product {
  String TenSP;
  String GiaSP;
  String Tenshop;
  String Giamgia;
  String MoTa;
  String? Sdt;
  String SoLuong;
  bool Trangthai;
  Product(
      {required this.TenSP,
      required this.GiaSP,
      required this.Tenshop,
      required this.MoTa,
      required this.SoLuong,
      required this.Giamgia,
      required this.Sdt,
      required this.Trangthai});
  Map<String, dynamic> tomap() {
    return {
      "tensp": TenSP,
      "giasp": GiaSP,
      "MoTa": MoTa,
      "SoLuong": SoLuong,
      "TrangThai": Trangthai,
      "GiamGia": Giamgia,
      "Sdt": Sdt,
      "Tenshop": Tenshop
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        TenSP: map['tensp'] ?? '',
        GiaSP: map['giasp'] ?? '',
        MoTa: map['MoTa'] ?? '',
        Trangthai: map['TrangThai'] ?? '',
        SoLuong: map['SoLuong'] ?? '',
        Giamgia: map['GiamGia'] ?? '',
        Sdt: map['Sdt'] ?? ' ',
        Tenshop: map['Tenshop'] ?? ' ');
  }
}
