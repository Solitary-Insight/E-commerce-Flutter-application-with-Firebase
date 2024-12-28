import 'package:flutter/material.dart';
import 'package:t_store/common/Widgets/cutomWidgets/linearProgressIndicatorWithText.dart';

class customProgressIndicatorWidget extends StatelessWidget {
  const customProgressIndicatorWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 7,
        child: Column(
          children: [
            linearProgressIndicatorWithText(
              value: 5,
            ),
            linearProgressIndicatorWithText(
              value: 4,
            ),
            linearProgressIndicatorWithText(
              value: 3,
            ),
            linearProgressIndicatorWithText(
              value: 2,
            ),
            linearProgressIndicatorWithText(
              value: 1,
            )
          ],
        ));
  }
}
