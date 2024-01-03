import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/customDrawer.dart';
import 'package:flutter/material.dart';

class SeguimientoPage extends StatelessWidget {
    final Map<String, dynamic> prospecto;

  SeguimientoPage({Key? key, required this.prospecto}) : super(key: key);

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
                  CustomAppbar(title: 'Seguimiento'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nombre Completo: Juan Perez'),
                            Text('Email: juan.perez@example.com'),
                            Text('Precio Inicial: \$1000'),
                            Text('Precio Pactado: \$900'),
                            Text('Acciones Realizadas: Llamada, Envío de correo'),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Handle send to sales
                              },
                              child: Text('Enviar a Ventas'),
                            ),
                          ],
                        ),
                      ),
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