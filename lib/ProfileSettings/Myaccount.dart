import 'package:flutter/material.dart';

class ProfileManagementScreen extends StatefulWidget {
  const ProfileManagementScreen({super.key});

  @override
  _ProfileManagementScreenState createState() => _ProfileManagementScreenState();
}

class _ProfileManagementScreenState extends State<ProfileManagementScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                updateProfile();
              },
              child: const Text('Save Changes'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                navigateToUpdateProfileScreen(context);
              },
              child: const Text('Update Profile Screen'),
            ),
          ],
        ),
      ),
    );
  }

  void updateProfile() {
    String newName = nameController.text;
    String newEmail = emailController.text;

    // Call API or update profile in your database with the new information
    // Example:
    // authService.updateUserProfile(newName, newEmail).then((success) {
    //   if (success) {
    //     // Profile updated successfully
    //     // Navigate back or show a success message
    //   } else {
    //     // Show error message indicating update failed
    //   }
    // }).catchError((error) {
    //   // Handle error from API or database
    // });

    // For demonstration purposes, simply print the updated profile info
    print('New Name: $newName');
    print('New Email: $newEmail');
  }

  void navigateToUpdateProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileUpdateScreen()),
    );
  }
}

class ProfileUpdateScreen extends StatelessWidget {
  const ProfileUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
      ),
      body: const Center(
        child: Text('Profile Update Screen'),
      ),
    );
  }
}
