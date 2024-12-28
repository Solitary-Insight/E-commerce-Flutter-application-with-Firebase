import 'package:flutter/material.dart';

import '../../Shapes/invertedRoundClipper.dart';

class curvedEdgesWidget extends StatelessWidget {
  const curvedEdgesWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: invertedRoundClipper(), child: child);
  }
}
