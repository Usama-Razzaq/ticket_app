import 'package:flutter/material.dart';
import 'package:ticket_app/res/styles/app_styles.dart';

class AppTextIcon extends StatelessWidget {
  const AppTextIcon({super.key, required this.text, required this.icon});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,

      ),
      child:  Row(
        children: [
          Icon(icon, color: AppStyles.planeColor,),
           const SizedBox(width: 10,),
           Text( text, style: AppStyles.textStyle,),
        ],
      ),
    );
  }
}
