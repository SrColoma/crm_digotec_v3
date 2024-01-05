import 'package:crm_digotec_v3/CustomAppBar.dart';
import 'package:crm_digotec_v3/customDrawer.dart';
import 'package:flutter/material.dart';

class ActionTable extends StatelessWidget {
  final List<Map<String, dynamic>> datos;
  final Function(Map<String, dynamic>) onFirstColumnTap;
  final List<Map<String, dynamic>> actions;
  final String firstColumn;
  final List<String> noShow;

  ActionTable({Key? key, required this.datos, required this.onFirstColumnTap, required this.actions, this.firstColumn = 'nombre', this.noShow = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Convert JSON to DataColumn and DataRow
    var columns = datos[0].keys.toList();
    columns = columns.where((column) => !noShow.contains(column)).toList();
    if (columns.contains(firstColumn)) {
      columns.remove(firstColumn);
      columns.insert(0, firstColumn);
    }
    final dataColumns = [...columns.map((key) => DataColumn(label: Text(key))).toList(), DataColumn(label: Text('Acciones'))];
    final rows = datos.map((item) {
      final cells = columns.map((column) {
        return {
          'value': item[column],
          'cell': DataCell(Text(item[column].toString())),
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
        columns: dataColumns,
        rows: rows,

      ),
    );
  }
}

