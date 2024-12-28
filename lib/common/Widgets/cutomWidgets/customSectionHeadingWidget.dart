import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class customSectionHeading extends StatelessWidget {
  const customSectionHeading({
    super.key,
    required this.heading,
    // this.textColor = TColors.white,
    this.ShowButton = false,
    this.onPressed,
    this.buttonText = 'view all',
    this.textColor = TColors.textWhite,
  });
  final String heading;
  final String buttonText;
  final Color textColor;
  final bool ShowButton;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            child: ShowButton
                ? TextButton(
                    onPressed: onPressed,
                    child: Text(
                      buttonText,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ))
                : null,
          )
        ],
      ),
    );
  }
}
