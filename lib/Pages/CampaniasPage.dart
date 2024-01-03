import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/components/ActionTable.dart';
import 'package:crm_digotec_v3/customDrawer.dart';
import 'package:flutter/material.dart';

class CampaniasPage extends StatelessWidget {
  static const String routeName = '/campanias';
  const CampaniasPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define your DataRows
    final datos = [
      {
        'Nombre de la Campaña': 'Campaña 1',
        'Fecha de Inicio': '01/01/2022',
        'Fecha de Finalización': '31/01/2022',
        'Presupuesto': '1000',
        'Tipo': 'Tipo 1',
        'Estado': 'Activo'
      },
      {
        'Nombre de la Campaña': 'Campaña 2',
        'Fecha de Inicio': '02/02/2022',
        'Fecha de Finalización': '28/02/2022',
        'Presupuesto': '2000',
        'Tipo': 'Tipo 2',
        'Estado': 'Inactivo'
      },
      {
        'Nombre de la Campaña': 'Campaña 3',
        'Fecha de Inicio': '03/03/2022',
        'Fecha de Finalización': '31/03/2022',
        'Presupuesto': '3000',
        'Tipo': 'Tipo 3',
        'Estado': 'Activo'
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
                  CustomAppbar( title: 'Campañas'),
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
                              child: Text('Nueva campaña'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20), 
                        ActionTable(
                          json: datos,
                          onFirstColumnTap: (value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalleCampaniaPage(campania: 'Campaña 1'),
                              ),
                            );
                          },
                          actions: [
                            {
                              'nombre': 'Eliminar',
                              'accion': (item) {
                                print('Eliminar $item');
                              },
                            },
                            {
                              'nombre': 'Acción 2',
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

class DetalleCampaniaPage extends StatelessWidget {
  final String campania;

  DetalleCampaniaPage({Key? key, required this.campania}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(campania),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Detalles de la campaña...'),
      ),
    );
  }
}