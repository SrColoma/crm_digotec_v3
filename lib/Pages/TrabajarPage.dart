import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/CustomDrawer.dart';
import 'package:flutter/material.dart';

class TrabajarPage extends StatelessWidget {
  static const String routeName = '/trabajar';
  final Map<String, dynamic> prospecto;

  TrabajarPage({Key? key, required this.prospecto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children:[
          CustomDrawer(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
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
                              subtitle: Text('${prospecto['nombre']}'),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text('Email'),
                              subtitle: Text('${prospecto['email']}'),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              title: Text('Telefono'),
                              subtitle: Text('${prospecto['telefono']}'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Acciones a realizar',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Detalle de las acciones',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Llamar a las 10:00 am, enviar correo con detalles del producto, enviar cotización",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Producto',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Producto 1',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Precio inicial',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '\$ 100.00',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  // Add your price here
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Observaciones',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'observaciones de el contacto',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'precio pactado',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('se marcara como contactado por primera vez'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // Handle button press
                                            },
                                            child: Text('Si'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('No'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text('Reagendar'),
                                ),
                                SizedBox(width: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('¿Estas seguro que deseas eliminar el prospecto?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // Handle button press
                                            },
                                            child: Text('Si'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('No'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text('Elminar'),
                                ),
                                SizedBox(width: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    // show dialog de seguro que realizastes las actividades para convertir al prospecto
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('¿Estas seguro de que realizastes las actividades?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // Handle button press
                                            },
                                            child: Text('Si'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('No'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text('Convertir a oportunidad'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}