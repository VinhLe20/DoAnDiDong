class CartProduct {
  String TenSP;
  String Tenshop;
  int GiaSP;
  int Giamgia;
  //String MoTa;
  String? email;
  int SoLuong;
  bool Trangthai;
  String img;
  bool xoa;
  CartProduct(
      {required this.TenSP,
      required this.GiaSP,
      required this.Tenshop,
      //   required this.MoTa,
      required this.SoLuong,
      required this.Giamgia,
      required this.email,
      required this.img,
      required this.xoa,
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
      "email": email,
      "xoa": xoa,
      "img": img
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
        xoa: map['xoa'] ?? '',
        Giamgia: map['GiamGia'] ?? '',
        email: map['email'] ?? ' ',
        img: map['img'] ?? ' ');
  }
}
