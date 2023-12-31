import 'package:flutter/material.dart';
import 'package:food_recipe/screens/profile_page.dart/profile_page.dart';

class WelcomeCard extends StatelessWidget {
  final String title;
  const WelcomeCard({
    super.key,
    required this.title,
  });
  final String welcome = "Hoşgeldin";
  final String headerMessage = "Sana Özel Lezzetli Tarifler Bulalım";
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          "$welcome $title",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          headerMessage,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ));
          },
        ));
  }
}
