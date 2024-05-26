import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:table_test/ui/views/home/home_viewmodel.dart';
import 'package:table_test/ui/views/home/widgets/data_source.dart';

class SfTable extends ViewModelWidget<HomeViewModel> {
  const SfTable({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SfDataGridTheme(
          data: SfDataGridThemeData(headerColor: Colors.grey),
          child: Screenshot(
             controller: viewModel.screenshotController,
            child: SfDataGrid(
              verticalScrollController: viewModel.scrollController,
              source:  CustomDataGridSource(viewModel. paginatedData[viewModel.currentPage],viewModel.searchController.text),
              allowSorting: true,
              allowMultiColumnSorting: true,
              columnWidthMode: ColumnWidthMode.fill,
              headerRowHeight: 50,
              gridLinesVisibility: GridLinesVisibility.horizontal,
              headerGridLinesVisibility: GridLinesVisibility.both,
              selectionMode: SelectionMode.multiple,
              columns: [
                GridColumn(
                  columnName: 'requisitionNumber',
                  width: 70,
                  label: const Text(
                    'Requisition Number',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
                GridColumn(
                    columnName: 'poNo',
                    label: const Text(
                      'PO NO',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                GridColumn(
                    columnName: 'requestor',
                    label: const Text(
                      'Requestor',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                GridColumn(
                    columnName: 'requisitionDate',
                    label: const Text(
                      'Requisition Date',
                   style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                GridColumn(
                    columnName: 'department',
                    width: 120,
                    label: const Text(
                      'Department',
                       style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                GridColumn(
                    columnName: 'currency',
                    label: const Text(
                      'Currency',
                       style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                GridColumn(
                    columnName: 'amount',
                    label: const Text(
                      'Amount',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                GridColumn(
                    columnName: 'gbpAmount',
                    label: const Text(
                      'GBP Amount',
                       style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                GridColumn(
                    columnName: 'vatAmount',
                    label: const Text(
                      'VAT Amount',
                       style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                GridColumn(
                    columnName: 'totalAmount',
                    label: const Text(
                      'Total Amount',
                       style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                GridColumn(
                    columnName: 'status',
                    columnWidthMode: ColumnWidthMode.fitByCellValue,
                    label: const Text(
                      'Status',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                GridColumn(
                    columnName: 'ceaYesNo',
                    columnWidthMode: ColumnWidthMode.fitByCellValue,
                    label: const Text(
                      'CEA Yes/No',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                GridColumn(
                    columnName: 'ceaNumber',
                    columnWidthMode: ColumnWidthMode.fitByCellValue,
                    label: const Text(
                      'CEA Number',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
                GridColumn(
                    columnName: 'remarks',
                    columnWidthMode: ColumnWidthMode.fitByCellValue,
                    width: 170,
                    label: const Text(
                      'Remarks',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        );
  }
}