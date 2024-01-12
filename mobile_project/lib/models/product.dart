class Product {
  String TenSP;
  String GiaSP;
  String MoTa;
  String SoLuong;
  bool TrangThai = true;
  Product(
      {required this.TenSP,
      required this.GiaSP,
      required this.MoTa,
      required this.SoLuong,
      required this.TrangThai});
  Map<String, dynamic> tomap() {
    return {
      "tensp": TenSP,
      "giasp": GiaSP,
      "MoTa": MoTa,
      "SoLuong": SoLuong,
      "TrangThai": TrangThai
    };
  }
}