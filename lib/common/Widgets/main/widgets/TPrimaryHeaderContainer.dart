import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../customShapes/containers/customCircularContainer.dart';
import '../../cutomWidgets/curvedEdgesWidget.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
    this.height = 320,
  });
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return curvedEdgesWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          // height: height,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                right: -250,
                top: -150,
                child: customCircularContainer(
                  height: 400,
                  padding: const EdgeInsets.all(0),
                  width: 400,
                  radius: 400,
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                right: -300,
                top: 100,
                child: customCircularContainer(
                  height: 400,
                  padding: const EdgeInsets.all(0),
                  width: 400,
                  radius: 400,
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
