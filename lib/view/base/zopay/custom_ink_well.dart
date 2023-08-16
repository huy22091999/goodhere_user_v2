import 'package:flutter/material.dart';

import '../../../utils/color_resources.dart';


class CustomInkWell extends StatelessWidget {
  final double? radius;
  final Widget? child;
  final VoidCallback? onTap;
  final Color? highlightColor;

  const CustomInkWell(
      { this.radius,
       this.child,
       this.onTap,
       this.highlightColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius ?? 0.0),
        highlightColor:
            highlightColor ?? ColorResources.getPrimaryColor().withOpacity(0.5),
        hoverColor: ColorResources.getPrimaryColor(),
        child: child,
      ),
    );
  }
}
