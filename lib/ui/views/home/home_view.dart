import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:table_test/ui/common/ui_helpers.dart';
import 'package:table_test/ui/views/home/widgets/app_bar.dart';
import 'package:table_test/ui/views/home/widgets/page_builder.dart';
import 'package:table_test/ui/views/home/widgets/title.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const HomeViewAppBar(),
      body: ListView(
        children: const [
          HomeTitle(),
          HomePageBuilder(),
          verticalSpaceSmall,
        ],
      ),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.onViewModelReady();

    super.onViewModelReady(viewModel);
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
