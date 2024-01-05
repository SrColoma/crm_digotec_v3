import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/Pages/AsignarCampaniasPage.dart';
import 'package:crm_digotec_v3/Pages/DetalleCampaniaPage.dart';
import 'package:crm_digotec_v3/components/ActionTable.dart';
import 'package:crm_digotec_v3/customDrawer.dart';
import 'package:crm_digotec_v3/utils/ApiClient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CampaniasPage extends StatelessWidget {
  static const String routeName = '/campanias';
  static const String endpoint = '/venta/get_campains';
  const CampaniasPage({super.key});

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
                        CustomAppbar( title: 'Campañas'),
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
                                //       child: Text('Nueva Oportunidad'),
                                //     ),
                                //   ],
                                // ),
                                SizedBox(height: 20), 
                                ActionTable(
                                  datos: datos,
                                  onFirstColumnTap: (value) {
                                    print(value);
                                  },
                                  actions: [
                                    {
                                      'nombre': 'Eliminar',
                                      'accion': (item) {
                                        print('Eliminar $item');
                                      },
                                    },
                                    {
                                      'nombre': 'Asignar',
                                      'accion': (item) {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => AsignarCampaniaPage(campania: item),
                                          ),
                                        );
                                      },
                                    },
                                  ],
                                  firstColumn: 'nombre',
                                  // config: {
                                  //   'noshow': ['Estado', 'Tipo'],
                                  //   'link': 'nombre'
                                  // },
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
      },
    );

  }
}
