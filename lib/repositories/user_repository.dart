import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../features/authentication/models/user_model.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;

  /// [_triggerAcallToUserDocument] -- a reference to the user document
  DocumentReference<UserModel> _triggerAcallToUserDocument(
    String uid,
    String email,
  ) {
    try {
      final userRef = _db.collection('users').doc(uid).withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromDocument(snapshot.data()!),
          toFirestore: (user, options) => user.toDocument(),
        );

    return userRef;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// [createUserDocument] -- only when new user is created
  Future<void> createUserDocument(UserModel user) async {
    try {
      await _triggerAcallToUserDocument(user.uid, user.email).set(user);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
