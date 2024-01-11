import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class imagePicker {
  Rx<File> image = File('').obs;
  Rx<String> networdImage = ''.obs;
  Future pickImage() async {
    try {
      final imagePick =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagePick == null) return;
      final imageTemp = File(imagePick.path);
      image.value = imageTemp;
    } on PlatformException catch (e) {
      return e;
    }
  }

  Future<String> uploadImageToFirebase() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      Reference reference =
          FirebaseStorage.instance.ref().child('images/$fileName.png');
      await reference.putFile(image.value);
      String downloadURL = await reference.getDownloadURL();
      networdImage.value = downloadURL;
      return downloadURL;
    } catch (e) {
      return '';
    }
  }

  Future<void> updateAccount(String phone, String image) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await users.get();
    querySnapshot.docs.forEach((doc) async {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (phone == data["Phone"]) {
        CollectionReference collection =
            FirebaseFirestore.instance.collection('users');
        DocumentReference document = collection.doc(doc.id);
        Map<String, dynamic> dataToUpdate = {
          'Image': image,
        };
        try {
          await document.update(dataToUpdate);
          print('Document successfully updated');
        } catch (e) {
          print('Error updating document: $e');
        }
      }
    });
  }
}
