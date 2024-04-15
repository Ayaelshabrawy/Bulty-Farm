import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: currentPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Current Password'),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'New Password'),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: confirmNewPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirm New Password'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                changePassword();
              },
              child: const Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }

  void changePassword() {
    String currentPassword = currentPasswordController.text;
    String newPassword = newPasswordController.text;
    String confirmNewPassword = confirmNewPasswordController.text;

    // Validate password change fields
    if (newPassword != confirmNewPassword) {
      // Show error message that new passwords don't match
      return;
    }

    // Call your authentication service or API to change the password
    // Example:
    // authService.changePassword(currentPassword, newPassword).then((success) {
    //   if (success) {
    //     // Password changed successfully
    //     // Navigate to a success screen or show a success message
    //   } else {
    //     // Show error message indicating password change failed
    //   }
    // }).catchError((error) {
    //   // Handle error from authentication service or API
    // });

    // Clear password fields after changing
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmNewPasswordController.clear();
  }
}
class AuthService {
  Future<bool> changePassword(String currentPassword, String newPassword) async {
    // Validate current password (mocked validation for demonstration)
    if (currentPassword != 'correctpassword') {
      // Current password is incorrect
      return false;
    }

    // Update password in the database (mocked update for demonstration)
    // Replace this with actual database update logic
    // For example, using Firebase Authentication, you would call:
    // await FirebaseAuth.instance.currentUser.updatePassword(newPassword);

    // Password changed successfully
    return true;
  }
}
