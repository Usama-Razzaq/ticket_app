import 'package:flutter/material.dart';

class AppLayoutBuilderWidget extends StatelessWidget {
  final int randomDivider;
  final double width;
  final bool? isColor;
  const AppLayoutBuilderWidget({super.key, required this.randomDivider, this.width= 3, required this.isColor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint){
      return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
      children:
        List.generate((constraint.constrainWidth()/randomDivider).floor(), (index) =>  SizedBox(
          width: width,
          height: 1,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isColor == null? Colors.white: Colors.grey.shade300,
            ),
          ),
        )),
      );

    });

  }
}
