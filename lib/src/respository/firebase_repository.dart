import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/src/data/model.dart';

class FirebaseRepository {
  FirebaseFirestore getFirestoreInstance() {
    return FirebaseFirestore.instance;
  }

  saveData(Model model) async {
    try {
      return await getFirestoreInstance()
          .collection("data")
          .add(model.toJson())
          .then((DocumentReference doc) =>
              debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
    } catch (e) {
      debugPrint("error $e");
    }
    ;
  }
}
