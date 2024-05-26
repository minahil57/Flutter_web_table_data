import 'package:flutter/material.dart';
import 'package:table_test/ui/common/ui_helpers.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          horizontalSpaceSmall,
          const Text(
            'Requisition List Report',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Icon(
            Icons.search,
            color: Theme.of(context).iconTheme.color,
          ),
        ],
      ),
    );
  }
}
