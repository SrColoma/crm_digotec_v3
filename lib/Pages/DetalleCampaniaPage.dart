import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/CustomDrawer.dart';
import 'package:crm_digotec_v3/components/ActionTable.dart';
import 'package:flutter/material.dart';

class DetalleCampaniaPage extends StatelessWidget {
    final Map<String, dynamic> campania;

  DetalleCampaniaPage({Key? key, required this.campania}) : super(key: key);


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
                  CustomAppbar( title: 'Detalle de ${campania['Nombre de la Campaña']}' ),
                  Padding(  
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 20), 
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     ElevatedButton(
                        //       onPressed: () {
                        //         // Handle button press
                        //       },
                        //       child: Text('Nueva tarea'),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 20), 
                        ActionTable(
                          datos: datos,
                          onFirstColumnTap: (value) {
                          },
                          actions: [
                            // {
                            //   'nombre': 'Eliminar',
                            //   'accion': (item) {
                            //     print('Eliminar $item');
                            //   },
                            // },
                            {
                              'nombre': 'Asignar',
                              'accion': (item) {
                                print('Acción 2 $item');
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