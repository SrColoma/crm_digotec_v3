import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/Pages/SeguimientoPage.dart';
import 'package:crm_digotec_v3/components/ActionTable.dart';
import 'package:crm_digotec_v3/customDrawer.dart';
import 'package:crm_digotec_v3/utils/ApiClient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OportunidadesPage extends StatelessWidget {
  static const String routeName = '/oportunidades';
  static const String endpoint = '/venta/get_oportunidades';
  const OportunidadesPage({super.key});


  @override
  Widget build(BuildContext context) {
    // Get the ApiClient from the context
    final apiClient = Provider.of<ApiClient>(context, listen: false);

    // Fetch the data
    final datosFuture = apiClient.get(endpoint);


    // final datos = [
    //   {
    //     'Nombre Completo': 'Alejandro',
    //     'Compania': 'Digotec',
    //     'Email': 'unemail@mailcom',
    //     'Telefono': '123456789',
    //     'Estado': 'Nuevo'
    //   },
    //   {
    //     'Nombre Completo': 'Juan',
    //     'Compania': 'Digotec',
    //     'Email': 'unemail@mailcom',
    //     'Telefono': '123456789',
    //     'Estado': 'Nuevo'
    //   },
    //   {
    //     'Nombre Completo': 'Pedro',
    //     'Compania': 'Digotec',
    //     'Email': 'unemail@mailcom',
    //     'Telefono': '123456789',
    //     'Estado': 'Nuevo'
    //   },
    //   {
    //     'Nombre Completo': 'Maria',
    //     'Compania': 'Digotec',
    //     'Email': 'unemail@mailcom',
    //     'Telefono': '123456789',
    //     'Estado': 'Nuevo'
    //   },
    // ];
    

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
                        CustomAppbar( title: 'Oportunidades'),
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
                                    'nombre': 'Seguimiento',
                                    'accion': (item) {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => SeguimientoPage(prospecto: item),
                                        ),
                                      );
                                    },
                                  },
                                  {
                                    'nombre': 'Mandar a prospecto',
                                    'accion': (item) {
                                      print('Acción 2 $item');
                                    },
                                  },
                                  {
                                    'nombre': 'Eliminar',
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
          // Rest of your code...
        }
      },
    );



  }
}