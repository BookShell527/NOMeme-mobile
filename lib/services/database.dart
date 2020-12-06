import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference messageCollection = FirebaseFirestore.instance.collection("message");

  Future sendMessage(String email, String name, String message) async {
    return await messageCollection.doc().set({'email': email, 'name': name, 'message': message});
  }
}