import 'package:flutter/material.dart';

import '../../../utils/dimensions.dart';
import '../../../utils/styles.dart';

class LandingCard extends StatelessWidget {
  final String icon;
  final String title;
  const LandingCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, alignment: Alignment.center,
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
        color: Theme.of(context).primaryColor.withOpacity(0.05),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

        Image.asset(icon, width: 45, height: 45),
        const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

        Text(title, style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall), textAlign: TextAlign.center),

      ]),
    );
  }
}
