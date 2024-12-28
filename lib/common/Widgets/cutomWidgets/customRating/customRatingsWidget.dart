import 'package:flutter/material.dart';
import 'package:t_store/common/Widgets/cutomWidgets/customRating/customProgressIndicatorWidget.dart';

class customRatingsWidget extends StatelessWidget {
  const customRatingsWidget({
    super.key,
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                rating.toString(),
                style: Theme.of(context).textTheme.displayLarge,
              )),
          customProgressIndicatorWidget(),
        ],
      ),
    );
  }
}
