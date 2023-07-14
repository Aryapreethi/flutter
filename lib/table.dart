import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Example'),
      ),
      body: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Column 1',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Column 2',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Column 3',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Row 1 Data 1')),
              DataCell(Text('Row 1 Data 2')),
              DataCell(Text('Row 1 Data 3')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Data 1')),
              DataCell(Text('Data 2')),
              DataCell(Text('Data 3')),
            ],
          ),
          // Add more DataRow widgets for additional rows
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyTable(),
  ));
}

