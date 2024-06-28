
import 'package:bulty_farmm/enums.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? photoUrl;
  final String role;
  final List<String>? favorite;
  final List<String>? cart;
  final String? address;
  final String phone;


  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.photoUrl,
    this.role = 'customer',
    this.favorite,
    this.cart,
    this.address,
    required this.phone,
  });


  // [toDocument] --
  Map<String, dynamic> toDocument() {
    return { 
      "uid": uid,
      "name": name,
      "email": email,
      "photoUrl": photoUrl,
      "role": role,
      "favorite": favorite,
      "cart": cart,
      "address": address,
      "phone": phone,
    };
  }

  // [fromDocument]
  factory UserModel.fromDocument(Map<String,dynamic> doc) {
    return UserModel(
      uid: doc['uid'],
      name: doc['name'],
      email: doc['email'],
      photoUrl: doc['photoUrl'],
      role: doc['role'],
      favorite: doc['favorite'],
      cart: doc['cart'],
      address: doc['address'],
      phone: doc['phone'],
    );
  }
}