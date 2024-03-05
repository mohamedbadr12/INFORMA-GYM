import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../constant.dart';

class BuildMenuAppBar extends StatelessWidget {
  const BuildMenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: LinearGradient(colors: [
        kPrimaryColor,kSecondaryColor
      ])),

      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text("Favourites"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.music_note_outlined),
            title: const Text("Music"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.map_outlined),
            title: const Text("Google Maps"),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_outlined),
            title: const Text("Cart"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            onTap: () {},
          ), ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            onTap: () async{
              await FirebaseAuth.instance.signOut();
                     GoogleSignIn google = GoogleSignIn();
                      google.disconnect();
                       Navigator.pushNamed(context, "/");
            },
          ),
        ],
      ),
    );
  }
}
