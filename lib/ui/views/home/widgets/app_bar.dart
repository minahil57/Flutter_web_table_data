import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'package:stacked/stacked.dart';
import 'package:table_test/ui/common/app_colors.dart';
import 'package:table_test/ui/views/home/home_viewmodel.dart';
import 'package:table_test/ui/views/home/widgets/generate_pdf.dart';

class HomeViewAppBar extends ViewModelWidget<HomeViewModel>
    implements PreferredSizeWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: kToolbarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: kElevationToShadow[16],
              border: Border.all(
                  color: Theme.of(context).iconTheme.color!, width: 0.5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: viewModel.skipToFirstPage,
                child: Icon(
                  Icons.skip_previous,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              GestureDetector(
                onTap: viewModel.goToPreviousPage,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              SizedBox(
                height: 30,
                width: 70,
                child: Center(
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    cursorHeight: 15,
                    controller: viewModel.pageIndexController,
                    onSubmitted: (value) => viewModel.checkIndex(context),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(),
                      hintText: '1',
                    ),
                  ),
                ),
              ),
              Text(
               ' ${viewModel.currentPage + 1}',
              ),
              GestureDetector(
                onTap: viewModel.goToNextPage,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              GestureDetector(
                onTap: viewModel.skipToLastPage,
                child: Icon(
                  Icons.skip_next,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              GestureDetector(
                onTap: viewModel.reset,
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black54,
                  )),
                  child: const Center(
                      child: Icon(
                    Icons.refresh,
                  )),
                ),
              ),
              const Icon(
                Icons.arrow_back_rounded,
              ),
              DropdownButton<String>(
                value: viewModel.selectedWidth,
                onChanged: (String? newValue) {
                  viewModel.onChange(newValue);
                },
                items: viewModel.widthOptions.keys
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              GestureDetector(
                onTap: viewModel.saveImage,
                child: const Icon(
                  Icons.save_alt_outlined,
                ),
              ),
              GestureDetector(
                onTap: () {
                  log('onPdfPress');
                  PdfPreview(
                    build: (format) => generatePdf(format, 'Pdf'),
                    onError: (context, error) {
                      log('error : $error');
                      return SnackBar(
                        content: Text(error.toString()),

                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.print_outlined,
                ),
              ),
              SizedBox(
                height: 30,
                width: 100,
                child: Center(
                  child: TextField(
                    cursorHeight: 15,
                    onEditingComplete: () => viewModel.rebuildUi(),
                    controller: viewModel.searchController,
                    onSubmitted: (value) => viewModel.checkIndex(context),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(),
                      hintText: 'Enter something to search',
                      hintStyle: TextStyle(color: kcLightGrey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
