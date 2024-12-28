import 'package:flutter/widgets.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class customCircularContainer extends StatelessWidget {
  const customCircularContainer({
    super.key,
    this.width,
    this.height,
    this.radius = TSizes.cardRadiusLg,
    this.padding = const EdgeInsets.all(TSizes.sm),
    this.child,
    required this.backgroundColor,
    this.margin,
    this.showBorder = false,
    this.borderColor = TColors.grey,
  });
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry padding;
  final EdgeInsets? margin;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor, width: 2) : null,
        color: backgroundColor ?? TColors.textWhite.withOpacity(0.1),
      ),
      child: child,
    );
  }
}
