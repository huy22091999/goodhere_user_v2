import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class TextFieldShadow extends StatelessWidget {
  final Widget? child;
  const TextFieldShadow({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 3))
        ],
      ),
      child: child,
    );
  }
}
