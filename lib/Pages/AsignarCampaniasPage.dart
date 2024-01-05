import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/CustomDrawer.dart';
import 'package:crm_digotec_v3/components/ActionTable.dart';
import 'package:crm_digotec_v3/utils/ApiClient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AsignarCampaniaPage extends StatelessWidget {
  static const String endpoint = '/venta/get_personas';
  final Map<String, dynamic> campania;
  const AsignarCampaniaPage({super.key, required this.campania});
  @override
  Widget build(BuildContext context) {
    // Get the ApiClient from the context
    final apiClient = Provider.of<ApiClient>(context, listen: false);

    // Fetch the data
    final datosFuture = apiClient.get(endpoint);

    return FutureBuilder(
      future: datosFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final datos = snapshot.data as List<Map<String, dynamic>>;

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
                        CustomAppbar( title: 'Asignar ${campania['Nombre de la Campaña']}' ),
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
                              //       child: Text('Nueva campaña'),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(height: 20), 
                              ActionTable(
                                datos: datos,
                                onFirstColumnTap: (value) {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => DetalleCampaniaPage(campania: 'Campaña 1'),
                                  //   ),
                                  // );
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
                                      // se asignara la campaña campania['Nombre de la Campaña'] a item['Nombre Completo']
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          title: Text('Asignar ${campania['nombre']}' ),
                                          content: Text('¿Desea asignar la campaña ${campania['nombre']} a ${item['nombre']}?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, 'Cancel'),
                                              child: const Text('Cancelar'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, 'OK'),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
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
    );
  }
}