import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: ListTile(
              title: Text('CRM Digotec'),
              subtitle: Text('Versión 1.5.0'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');

            },
          ),
          ListTile(
            leading: Icon(Icons.campaign),
            title: Text('Campañas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/campanias');
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Prospectos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/prospectos');
              // Navigator.of(context).popAndPushNamed('/prospectos');
              // Navigator.of(context).pushNamedAndRemoveUntil('/prospectos', (Route<dynamic> route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text('Oportunidades'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/oportunidades');
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Tareas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/tareas');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Productos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/productos');
            },
          ),
        ],
      ),
    );
  }
}