import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String title; // Add this

  const CustomAppbar({Key? key, required this.title}) : super(key: key); // Modify this

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // automaticallyImplyLeading: false,
      backgroundColor: Colors.grey[200],
      title: Text(title), // Modify this
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {},
        ),
        IconButton(
          icon: CircleAvatar(
            backgroundImage: NetworkImage('https://avatar.iran.liara.run/public/boy?username=Ash'),
          ),
          onPressed: () {},
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'Cerrar sesión':
                // Handle log out
                break;
              case 'Ver perfil':
                // Handle view profile
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Cerrar sesión',
              child: Text('Cerrar sesión'),
            ),
            const PopupMenuItem<String>(
              value: 'Ver perfil',
              child: Text('Ver perfil'),
            ),
          ],
        ),
      ],
    );
  }
}