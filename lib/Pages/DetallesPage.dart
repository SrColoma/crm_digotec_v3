import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/CustomDrawer.dart';
import 'package:flutter/material.dart';

class DetallesPage extends StatelessWidget {
  static const String routeName = '/detalles';
  final Map<String, dynamic> prospecto;

  DetallesPage({Key? key, required this.prospecto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  CustomAppbar(title: 'Detalles'),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          child: ListTile(
                            title: Text('Nombre Completo'),
                            subtitle: Text('${prospecto['Nombre Completo']}'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text('Email'),
                            subtitle: Text('${prospecto['Email']}'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text('Telefono'),
                            subtitle: Text('${prospecto['Telefono']}'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Acciones a realizar'),
                        ),
                        Card(
                          child: Column(
                            children: [
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Detalle de las acciones'),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Escribe una descripción aquí...',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Producto'),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Escribe los detalles del producto aquí...',
                                        ),
                                      ),
                                      Text('Precio inicial'),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Escribe el precio aquí...',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ]
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle button press
                              },
                              child: Text('Guardar'),
                            ),
                          ],
                        ),
                      ],
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