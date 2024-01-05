import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/customDrawer.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  static const String routeName = '/dashboard';
  const DashBoardPage({super.key});


  @override
  Widget build(BuildContext context) {
    // Define your DataRows

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
                  CustomAppbar( title: 'DashBoard'),
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
                              child: Text('-'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20), 
                        
                    
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