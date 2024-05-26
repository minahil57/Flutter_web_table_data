import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CustomDataGridSource extends DataGridSource {
  CustomDataGridSource(this.dataGridRows, this.searchQuery);

  List<DataGridRow> dataGridRows;
  String searchQuery;

  @override
  List<DataGridRow> get rows => dataGridRows;

  bool rowMatchesSearchQuery(DataGridRow row) {
    return row.getCells().any((cell) => cell.value.toString().toLowerCase().contains(searchQuery.toLowerCase()));
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    bool isMatch = rowMatchesSearchQuery(row);
    return DataGridRowAdapter(
      color: searchQuery.isNotEmpty && isMatch ? Colors.grey[300] : Colors.transparent,
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: Text(dataGridCell.value.toString()),
        );
      }).toList(),
    );
  }
}