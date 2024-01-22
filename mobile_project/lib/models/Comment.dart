import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String nameProduct;
  String id;
  String nameShop;
  String time;
  String comment;
  Comment(this.id, this.nameProduct, this.nameShop, this.comment, this.time);
  static List<Comment> comments =
      List.filled(0, Comment("", "", "", "", ""), growable: true);
  static Future<void> getData(String nameProduct, String nameShop) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('comments');
    QuerySnapshot querySnapshot = await users.get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (data["NameProduct"] == nameProduct && nameShop == data["NameShop"]) {
        Comment item = Comment(data["Email"], data["NameProduct"],
            data["NameShop"], data["Comment"], data["Time"]);
        comments.add(item);
      }
    }
  }
}
