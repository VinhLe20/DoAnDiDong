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

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
        TenSP: map['tensp'] ?? '',
        //Tenshop: map['tenshop'] ?? '',
        GiaSP: map['giasp'] ?? '',
        Trangthai: map['TrangThai'] ?? '',
        //Giamgia: map['GiamGia'] ?? '',
        Sdt: map['Sdt'] ?? ' ');
  }
}
