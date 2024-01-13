
class User2 {
  String phone;
  String Ten;
  String Diachi;
  String Image;
  bool shop;
  User2(
      {required this.Ten,
      required this.Diachi,
      required this.phone,
      required this.Image,
      required this.shop});
  Map<String, dynamic> tomap() {
    return {
      "Name": Ten,
      "Phone": phone,
      "Adress": Diachi,
      "Image": Image,
      "Shop": shop
    };
  }
}
