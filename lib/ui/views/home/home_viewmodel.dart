import 'dart:developer';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:table_test/models/grid_model.dart';

class HomeViewModel extends BaseViewModel {
  List<Requisition> requisitions = [];
  ScrollController scrollController = ScrollController();

// RequisitionDataSource ? requisitionDataSource  ;

  String selectedWidth = '100%';
  final Map<String, double> widthOptions = {
    '50%': 150,
    '75%': 75,
    '100%': 20,
  };
  final int itemsPerPage = 20;
  int currentPage = 0;
  TextEditingController pageIndexController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  List<DataGridRow>? dataSource;

  void saveImage() {
    screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List? image) async {
      if (image != null) {
        await WebImageDownloader.downloadImageFromUInt8List(uInt8List: image,name: 'requisition');
      }
    }).catchError((onError) {
      log(onError);
    });
  }

  void reset() {
    currentPage = 0;
    rebuildUi();
  }

  void skipToLastPage() {
    currentPage = paginatedData.length - 1;
    rebuildUi();
  }

  void skipToFirstPage() {
    currentPage = 0;
    rebuildUi();
  }

  void checkIndex(context) {
    int pagenumber = pageIndexController.text.isEmpty
        ? 0
        : int.parse(pageIndexController.text);
    log(pagenumber.toString());
    log(paginatedData.length.toString());
    if (pagenumber < 0 || pagenumber > paginatedData.length - 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Page Number')),
      );
      return;
    } else {
      onPageChanged(pagenumber);
    }
  }

  late List<List<DataGridRow>> paginatedData;
  onViewModelReady() {
    setBusy(true);

    dataSource = List<DataGridRow>.generate(
        100,
        (index) => DataGridRow(cells: [
              DataGridCell(
                  columnName: 'requisitionNumber',
                  value: faker.randomGenerator.numbers(10, 1).join()),
              DataGridCell(
                  columnName: 'poNo',
                  value: faker.randomGenerator.numbers(8, 1).join()),
              DataGridCell(columnName: 'requestor', value: faker.person.name()),
              DataGridCell(
                  columnName: 'requisitionDate',
                  value: faker.date
                      .dateTime(minYear: 2020, maxYear: 2024)
                      .toString()),
              DataGridCell(
                  columnName: 'department', value: faker.company.name()),
              DataGridCell(
                  columnName: 'currency', value: faker.currency.code()),
              DataGridCell(
                  columnName: 'amount',
                  value: faker.randomGenerator.decimal().toString()),
              DataGridCell(
                  columnName: 'gbpAmount',
                  value: faker.randomGenerator.decimal().toString()),
              DataGridCell(
                  columnName: 'vatAmount',
                  value: faker.randomGenerator.decimal().toString()),
              DataGridCell(
                  columnName: 'totalAmount',
                  value: faker.randomGenerator.decimal().toString()),
              DataGridCell(
                  columnName: 'status',
                  value:
                      faker.randomGenerator.boolean() ? "Approved" : "Pending"),
              DataGridCell(
                  columnName: 'ceaYesNo',
                  value: faker.randomGenerator.boolean() ? "Yes" : "No"),
              DataGridCell(
                  columnName: 'ceaNumber',
                  value: faker.randomGenerator.numbers(6, 1).join()),
              DataGridCell(
                  columnName: 'remarks', value: faker.lorem.sentence()),
            ]));
    // requisitionDataSource = RequisitionDataSource(requisitionData: requisitions);
    paginatedData = List.generate(
      (dataSource!.length / itemsPerPage).ceil(),
      (pageIndex) => dataSource!
          .skip(pageIndex * itemsPerPage)
          .take(itemsPerPage)
          .toList(),
    );
    setBusy(false);
  }

  void onChange(value) {
    selectedWidth = value;
    log(selectedWidth);
    rebuildUi();
  }

  Iterable<List<DataGridRow>> searchResult() sync* {
    List<DataGridRow> filteredDataSource = [];
    filteredDataSource = dataSource!.where((row) {
      return row.getCells().any((cell) => cell.value
          .toString()
          .toLowerCase()
          .contains(searchController.text.toLowerCase()));
    }).toList();
    yield filteredDataSource;
  }

  void onPageChanged(int index) {
    currentPage = index;
    rebuildUi();
  }

  void goToPreviousPage() {
    if (currentPage > 0) {
      currentPage--;
      rebuildUi();
    }
  }

  void goToNextPage() {
    if (currentPage < paginatedData.length - 1) {
      currentPage++;
      rebuildUi();
    }
  }
}
