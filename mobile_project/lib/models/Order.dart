import 'package:cloud_firestore/cloud_firestore.dart';

class Order2 {
  late String image;
  late String productName;
  late int quantity;
  late String email;
  late String userAddress;
  late String nameShop;
  late int totalAmount;
  late String status;

  Order2(this.productName, this.quantity, this.email, this.userAddress,
      this.totalAmount, this.status, this.image, this.nameShop);
  static List<Order2> oders =
      List.filled(0, Order2("", 0, "", "", 0, "", "", ""), growable: true);

  static Stream<List<Order2>> streamData(String? email, String status) {
    CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');
    return orders
        .where('email', isEqualTo: email)
        .where('status', isEqualTo: status)
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

  static Stream<List<Order2>> load(String tenShop) {
    CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');
    return orders
        .where('nameShop', isEqualTo: tenShop)
        .where('status', isEqualTo: "Chờ xác nhận")
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

  static Future<void> Xacnhan(String namesp, String nameshop) async {
    CollectionReference users = FirebaseFirestore.instance.collection('orders');
    QuerySnapshot querySnapshot = await users.get();
    Map<String, dynamic> dataToUpdate = {"status": "Đang giao hàng"};

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (data["nameShop"] == nameshop && data["productName"] == namesp) {
        DocumentReference document = users.doc(doc.id);
        document.update(dataToUpdate);
      }
    }
  }
}
