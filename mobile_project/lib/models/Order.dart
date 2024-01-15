import 'package:cloud_firestore/cloud_firestore.dart';

class Order2 {
  late String image;
  late String productName;
  late int quantity;
  late String userPhone;
  late String userAddress;
  late int totalAmount;
  late String status;

  Order2(this.productName, this.quantity, this.userPhone, this.userAddress,
      this.totalAmount, this.status, this.image);
  static List<Order2> oders =
      List.filled(0, Order2("", 0, "", "", 0, "", ""), growable: true);
  static Future<void> getData(String phone) async {
    CollectionReference users = FirebaseFirestore.instance.collection('orders');
    QuerySnapshot querySnapshot = await users.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (phone == data['userPhone'] && data["status"] == "Chờ Xác Nhận") {
        Order2 order = Order2(
            data["productName"],
            data["quantity"],
            data["userPhone"],
            data["userAddress"],
            data["totalAmount"],
            data["status"],
            data["image"]);
        oders.add(order);
      }
    }
  }
}
