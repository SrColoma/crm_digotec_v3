import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/Pages/DetallesPage.dart';
import 'package:crm_digotec_v3/Pages/TrabajarPage.dart';
import 'package:crm_digotec_v3/components/ActionTable.dart';
import 'package:crm_digotec_v3/customDrawer.dart';
import 'package:flutter/material.dart';

class ProspectosPage extends StatelessWidget {
  static const String routeName = '/prospectos';
  const ProspectosPage({super.key});


  @override
  Widget build(BuildContext context) {
    // Define your DataRows

    final datos = [
      {
        'Nombre Completo': 'Alejandro',
        'Compania': 'Digotec',
        'Email': 'unemail@mailcom',
        'Telefono': '123456789',
        'Estado': 'Nuevo'
      },
      {
        'Nombre Completo': 'Juan',
        'Compania': 'Digotec',
        'Email': 'unemail@mailcom',
        'Telefono': '123456789',
        'Estado': 'Nuevo'
      },
      {
        'Nombre Completo': 'Pedro',
        'Compania': 'Digotec',
        'Email': 'unemail@mailcom',
        'Telefono': '123456789',
        'Estado': 'Nuevo'
      },
      {
        'Nombre Completo': 'Maria',
        'Compania': 'Digotec',
        'Email': 'unemail@mailcom',
        'Telefono': '123456789',
        'Estado': 'Nuevo'
      },
    ];

    return Scaffold(
      body: Row(
        children:[
          CustomDrawer(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppbar( title: 'Prospectos'),
                  Padding(  
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 20), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle button press
                              },
                              child: Text('Nuevo Prospecto'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20), 
                        ActionTable(
                          json: datos,
                          onFirstColumnTap: (value) {
                            // print(value);
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => DetallesPage(prospecto: value),
                              ),
                            );
                          },
                          actions: [
                            {
                              'nombre': 'Trabajar',
                              'accion': (item) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => TrabajarPage(prospecto: item),
                                  ),
                                );
                              },
                            },
                            {
                              'nombre': 'inabilitar',
                              'accion': (item) {
                                print('inabilitar $item');
                              },
                            },
                          ],
                        )
                    
                      ]
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}