import 'package:flutter/material.dart';
import 'package:ticket_app/res/styles/app_styles.dart';

class BigDots extends StatelessWidget {
  final bool? isColor;
  const BigDots({super.key, this.isColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2.5,
              color: isColor == null ? Colors.white : AppStyles.dotColor,
          ),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
