class CartProduct {
  String TenSP;
  String Tenshop;
  int GiaSP;
  int Giamgia;
  //String MoTa;
  String? Sdt;
  int SoLuong;
  bool Trangthai;
  CartProduct(
      {required this.TenSP,
      required this.GiaSP,
      required this.Tenshop,
      //   required this.MoTa,
      required this.SoLuong,
      required this.Giamgia,
      required this.Sdt,
      required this.Trangthai});
  Map<String, dynamic> tomap() {
    return {
      "tensp": TenSP,
      "giasp": GiaSP,
      "tenshop": Tenshop,
      //  "MoTa": MoTa,
      "SoLuong": SoLuong,
      "TrangThai": Trangthai,
      "GiamGia": Giamgia,
      "Sdt": Sdt
    };
  }

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
        TenSP: map['tensp'] ?? '',
        Tenshop: map['tenshop'] ?? '',
        GiaSP: map['giasp'] ?? '',
        // MoTa: map['MoTa'] ?? '',
        Trangthai: map['TrangThai'] ?? '',
        SoLuong: map['SoLuong'] ?? '',
        Giamgia: map['GiamGia'] ?? '',
        Sdt: map['Sdt'] ?? ' ');
  }
}
