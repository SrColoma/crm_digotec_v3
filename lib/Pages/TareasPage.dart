import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/customDrawer.dart';
import 'package:flutter/material.dart';

class TareasPage extends StatelessWidget {
  static const String routeName = '/tareas';
  const TareasPage({super.key});


  @override
  Widget build(BuildContext context) {
    // Define your DataRows

    final dataColums = const <DataColumn>[
      DataColumn(
        label: Text('Nombre de la Campaña'),
      ),
      DataColumn(
        label: Text('Fecha de Inicio'),
      ),
      DataColumn(
        label: Text('Fecha de Finalización'),
      ),
      DataColumn(
        label: Text('Presupuesto'),
      ),
      DataColumn(
        label: Text('Tipo'),
      ),
      DataColumn(
        label: Text('Estado'),
      ),
    ];


    final dataRows = <DataRow>[
      DataRow(
        cells: <DataCell>[
          DataCell(Text('Campaña 1')),
          DataCell(Text('01/01/2022')),
          DataCell(Text('31/01/2022')),
          DataCell(Text('1000')),
          DataCell(Text('Tipo 1')),
          DataCell(Text('Activo')),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('Campaña 2')),
          DataCell(Text('02/02/2022')),
          DataCell(Text('28/02/2022')),
          DataCell(Text('2000')),
          DataCell(Text('Tipo 2')),
          DataCell(Text('Inactivo')),
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text('Campaña 3')),
          DataCell(Text('03/03/2022')),
          DataCell(Text('31/03/2022')),
          DataCell(Text('3000')),
          DataCell(Text('Tipo 3')),
          DataCell(Text('Activo')),
        ],
      ),
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
                  CustomAppbar( title: 'Tareas'),
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
                              child: Text('Nueva tarea'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20), 
                        SingleChildScrollView(
                          child: DataTable(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            columns: dataColums,
                            rows: dataRows,
                          ),
                        ),
                    
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