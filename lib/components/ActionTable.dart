import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/customDrawer.dart';
import 'package:flutter/material.dart';

class ActionTable extends StatelessWidget {
  final List<Map<String, dynamic>> json;
  final Function(Map<String, dynamic>) onFirstColumnTap;
  final List<Map<String, dynamic>> actions;

  ActionTable({Key? key, required this.json, required this.onFirstColumnTap, required this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Convert JSON to DataColumn and DataRow
    final columns = [...json[0].keys.map((key) => DataColumn(label: Text(key))).toList(), DataColumn(label: Text('Acciones'))];
    final rows = json.map((item) {
      final cells = item.entries.map((entry) {
        return {
          'value': entry.value,
          'cell': DataCell(Text(entry.value.toString())),
        };
      }).toList();
      cells.add({
        'value': 'Acciones',
        'cell': DataCell(
          DropdownButton<String>(
            onChanged: (value) {
              actions.firstWhere((action) => action['nombre'] == value)['accion'](item);
            },
            hint: Text('Acciones'),
            items: actions.map((action) {
              return DropdownMenuItem<String>(
                value: action['nombre'],
                child: Text(action['nombre']),
              );
            }).toList(),
          ),
        ),
      });
      return DataRow(
        cells: cells.map((cellData) {
          if (cells.first == cellData) {
            return DataCell(
              InkWell(
                child: Text(
                  cellData['value'].toString(),
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () => onFirstColumnTap(item), // Pass the entire row data
              ),
            );
          }
          return cellData['cell'] as DataCell;
        }).toList(),
      );
    }).toList();

    return SingleChildScrollView(
      child: DataTable(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        columns: columns,
        rows: rows,
      ),
    );
  }
}