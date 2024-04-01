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
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Home"),
            onTap: () {},
          ),
          const SizedBox(height: 15,),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text("Favourites"),
            onTap: () {},
          ),
          const SizedBox(height: 15,),

          ListTile(
            leading: const Icon(Icons.music_note_outlined),
            title: const Text("Music"),
            onTap: () {},
          ),
          const SizedBox(height: 15,),

          ListTile(
            leading: const Icon(Icons.map_outlined),
            title: const Text("Google Maps"),
            onTap: () {},
          ),
          const SizedBox(height: 15,),

          const Divider(
            color: Colors.black,
          ),
          const SizedBox(height: 15,),

          ListTile(
            leading: const Icon(Icons.shopping_cart_outlined),
            title: const Text("Cart"),
            onTap: () {},
          ),
          const SizedBox(height: 15,),

          ListTile(
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
