/*

  RX Types used from GETx 
*/


import 'package:bulty_farmm/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

Rx<User?> firebaseUser = Rx(null);


Rx<UserRole> roleOfUser = UserRole.unknown.obs;