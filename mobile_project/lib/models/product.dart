class Product {
  String TenSP;
  String GiaSP;
  String MoTa;
  String SoLuong;
  Product(
      {required this.TenSP,
      required this.GiaSP,
      required this.MoTa,
      required this.SoLuong});
  Map<String, dynamic> tomap() {
    return {
      "tensp": TenSP,
      "giasp": GiaSP,
      "MoTa": MoTa,
      "SoLuong": SoLuong,
    };
  }
}