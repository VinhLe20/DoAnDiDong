import 'package:cloud_firestore/cloud_firestore.dart';

class Order2 {
  String image;
  String productName;
  int quantity;
  String email;
  String userAddress;
  String nameShop;
  int totalAmount;
  String status;

  Order2(this.productName, this.quantity, this.email, this.userAddress,
      this.totalAmount, this.status, this.image, this.nameShop);
  static List<Order2> oders =
      List.filled(0, Order2("", 0, "", "", 0, "", "", ""), growable: true);
  static List<Order2> odersHuy =
      List.filled(0, Order2("", 0, "", "", 0, "", "", ""), growable: true);
  static Future<void> getData(String? email) async {
    CollectionReference users = FirebaseFirestore.instance.collection('orders');
    QuerySnapshot querySnapshot = await users.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (email == data['email'] && data["status"] == "Đang giao") {
        Order2 order = Order2(
            data["productName"],
            data["quantity"],
            data["email"],
            data["userAddress"],
            data["totalAmount"],
            data["status"],
            data["image"],
            data["nameShop"]);
        oders.add(order);
      }
    }
  }

  static Stream<List<Order2>> streamData(String? email) {
    CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');
    return orders
        .where('email', isEqualTo: email)
        .where('status', isEqualTo: 'Chờ Xác Nhận')
        .snapshots()
        .map(
          (QuerySnapshot querySnapshot) => querySnapshot.docs
              .map(
                (QueryDocumentSnapshot document) => Order2(
                  document["productName"],
                  document["quantity"],
                  document["email"],
                  document["userAddress"],
                  document["totalAmount"],
                  document["status"],
                  document["image"],
                  document["nameShop"],
                ),
              )
              .toList(),
        );
  }

  static Future<void> getHuy(String? email) async {
    CollectionReference users = FirebaseFirestore.instance.collection('orders');
    QuerySnapshot querySnapshot = await users.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (email == data['email'] && data["status"] == "Đã hủy") {
        Order2 order = Order2(
            data["productName"],
            data["quantity"],
            data["email"],
            data["userAddress"],
            data["totalAmount"],
            data["status"],
            data["image"],
            data["nameShop"]);
        odersHuy.add(order);
      }
    }
  }

  static Future<void> Huy(String? email, String namesp, String nameshop) async {
    CollectionReference users = FirebaseFirestore.instance.collection('orders');
    QuerySnapshot querySnapshot = await users.get();
    Map<String, dynamic> dataToUpdate = {"status": "Đã hủy"};

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (email == data['email'] &&
          data["nameShop"] == nameshop &&
          data["productName"] == namesp) {
        DocumentReference document = users.doc(doc.id);
        document.update(dataToUpdate);
      }
    }
  }
}
