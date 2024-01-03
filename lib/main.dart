import 'package:crm_digotec_v3/Pages/CampaniasPage.dart';
import 'package:crm_digotec_v3/Pages/DashboardPage.dart';
import 'package:crm_digotec_v3/Pages/DetallesPage.dart';
import 'package:crm_digotec_v3/Pages/OportunidadesPage.dart';
import 'package:crm_digotec_v3/Pages/ProductosPage.dart';
import 'package:crm_digotec_v3/Pages/ProspectosPage.dart';
import 'package:crm_digotec_v3/Pages/TareasPage.dart';
import 'package:crm_digotec_v3/customDrawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey[900],
            foregroundColor: Colors.white,
          ),
        ),
      ),
      routes: {
        DashBoardPage.routeName: (context) => const DashBoardPage(),
        CampaniasPage.routeName: (context) => const CampaniasPage(),
        ProspectosPage.routeName: (context) => const ProspectosPage(),
        OportunidadesPage.routeName: (context) => const OportunidadesPage(),
        TareasPage.routeName: (context) => const TareasPage(),
        // DetallesPage.routeName: (context) => const DetallesPage(),
        ProductosPage.routeName: (context) => const ProductosPage(),
      },
    );
  }
}