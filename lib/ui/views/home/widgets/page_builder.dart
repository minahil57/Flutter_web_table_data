import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:table_test/ui/views/home/home_viewmodel.dart';
import 'package:table_test/ui/views/home/widgets/table.dart';

class HomePageBuilder extends ViewModelWidget<HomeViewModel> {
  const HomePageBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: viewModel.widthOptions[viewModel.selectedWidth]!,
          vertical: 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,

        // width: MediaQuery.of(context).size.width * viewModel.widthOptions[viewModel.selectedWidth]!,
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewModel.paginatedData.length,
          controller: PageController(
              viewportFraction: 1, initialPage: viewModel.currentPage),
          onPageChanged: (index) {
            viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return const SfTable();
          },
        ),
      ),
    );
  }
}
