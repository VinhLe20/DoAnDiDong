import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  static String userName = "";
  static String userPhone = "";
  static String userAddress = "";
}

class Account {
  String email;
  String name;
  String phone;
  String adress;
  String image;
  bool shop;

  Account(
      this.email, this.name, this.phone, this.adress, this.shop, this.image);
  static Account acc = Account("", "", "", "", false, "");
  static Future<void> getData(String? email) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await users.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (email == doc.id) {
        acc = Account(data["Email"], data["Name"], data["Phone"],
            data["Adress"], data["Shop"], data["Image"]);
        UserProfile.userName = acc.name;
        UserProfile.userPhone = acc.phone;
        UserProfile.userAddress = acc.adress;
      }
    }
  }

  static bool isUserLoggedIn = false;

  Future<void> updateAccount(
      String? email, String image, String name, String adress) async {
    Map<String, dynamic> dataToUpdate;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await users.get();
    querySnapshot.docs.forEach((doc) async {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (email == doc.id) {
        DocumentReference document = users.doc(doc.id);
        if (image.isNotEmpty) {
          dataToUpdate = {'Image': image, 'Adress': adress, 'Name': name};
        } else {
          dataToUpdate = {'Adress': adress, 'Name': name};
        }
        try {
          await document.update(dataToUpdate);
        } catch (e) {}
      }
    });
  }

  static Future<void> addAccount(String id) async {
    Map<String, dynamic> dataToUpdate;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    dataToUpdate = {
      "Name": id,
      "Image": "",
      "Email": id,
      "Phone": "",
      "Shop": false,
      "Adress": ""
    };
    await users.doc(id).set(dataToUpdate);
    print(dataToUpdate);
  }
}
