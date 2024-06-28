import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff76984b);
const kBackgroundColor = Color(0xffececee);
const kContentColor = Color(0xffffffff);
const kSecondaryColor = Color(0xff101010);
const kTextColor = Color(0xff101010);
const kFontFamily = "Poppins";
const TextStyle headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  // Add other style properties as needed
);

const SizedBox sizedBoxHeight16 = SizedBox(height: 16);
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter a valid email address";

const String kNameNullError = "Please enter your first name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";

const String kPassNullError = "Please enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
final RegExp emailValidatorRegExp = RegExp(
  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?\.[a-zA-Z]{2,63}$",
);

final OutlineInputBorder kOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(color: Colors.black),
);

final InputDecoration otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 15),
  border: kOutlineInputBorder,
  focusedBorder: kOutlineInputBorder,
  enabledBorder: kOutlineInputBorder,
);
