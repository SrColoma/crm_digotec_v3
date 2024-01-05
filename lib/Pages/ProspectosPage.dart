import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/Pages/DetallesPage.dart';
import 'package:crm_digotec_v3/Pages/TrabajarPage.dart';
import 'package:crm_digotec_v3/components/ActionTable.dart';
import 'package:crm_digotec_v3/customDrawer.dart';
import 'package:crm_digotec_v3/utils/ApiClient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProspectosPage extends StatelessWidget {
  // /venta/get_prospectos
  static const String endpoint = '/venta/get_prospectos';
  static const String routeName = '/prospectos';
  const ProspectosPage({super.key});


  @override
  Widget build(BuildContext context) {

            // Get the ApiClient from the context
    final apiClient = Provider.of<ApiClient>(context, listen: false);

    // Fetch the data
    final datosFuture = apiClient.get(endpoint);
    
    // Define your DataRows

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
                        CustomAppbar( title: 'Prospectos'),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          );
        }
      },
    );
  }
}