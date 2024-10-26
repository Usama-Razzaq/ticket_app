import 'package:flutter/material.dart';

class BigCircles extends StatelessWidget {
  final bool isRight;
  final bool? isColor;
  const BigCircles({super.key, required this.isRight, required this.isColor});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 20,
      width: 10,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: isColor == null ? Colors.white : Colors.grey.shade200,
            borderRadius: isRight==true? const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10)
            ): const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)
            )
        ),
      ),
    )
    ;
  }
}
