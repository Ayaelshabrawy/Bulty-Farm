import 'package:flutter/material.dart';
import 'package:bulty_farmm/Owner/Home/loginasowner.dart';
import 'package:bulty_farmm/ProfileSettings/profile_menu.dart';
import 'package:bulty_farmm/ProfileSettings/profile_pic.dart';
import 'package:bulty_farmm/ProfileSettings/HelpCenter.dart';
import 'package:bulty_farmm/ProfileSettings/Notifications.dart';
import 'package:bulty_farmm/ProfileSettings/Setting.dart';
import 'package:bulty_farmm/ProfileSettings/Myaccount.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: Icons.person,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const ProfileManagementScreen ()),
                );
              },
            ),

            ProfileMenu(
              text: "Notifications",
              icon: Icons.notifications,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>   NotificationPage()),
                );
              },
            ),
            ProfileMenu(
              text: "Settings",
              icon: Icons.settings,
    press: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  const ChangePasswordScreen()),
    );
    },
    ),
            ProfileMenu(
              text: "Help Center",
              icon: Icons.help,
                press: () {
                Navigator.push(
                     context,
                    MaterialPageRoute(builder: (context) =>   const HelpCenter()),
                );
                },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: Icons.logout_outlined,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginasownerPage ()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
