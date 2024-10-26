import 'package:flutter/material.dart';
import 'package:ticket_app/res/styles/app_styles.dart';

class TicketPositionedCircles extends StatelessWidget {
  final bool? pos;
  const TicketPositionedCircles({super.key, required this.pos});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: pos==true? 22: null,
        right: pos==true?null:22,
        top: 262,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2.0, color: AppStyles.textColor)
          ),
          child: CircleAvatar(
            maxRadius: 4,
            backgroundColor: AppStyles.textColor,
          ),

        ));
  }
}
