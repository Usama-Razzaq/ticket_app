import 'package:flutter/material.dart';
import 'package:ticket_app/res/media.dart';
import 'package:ticket_app/res/styles/app_styles.dart';
import 'package:ticket_app/utills/all_json.dart';

class Hotel extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const Hotel({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 12),
      width: size.width * 0.6,
      height: 350,
      decoration: BoxDecoration(
        color: AppStyles.primaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
                color: AppStyles.primaryColor,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/${hotel['image']}"),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              hotel['place'],
              style:
                  AppStyles.headLineStyle1.copyWith(color: AppStyles.kakiColor),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              hotel['destination'],
              style: AppStyles.headLineStyle3.copyWith(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              '\$${hotel['price']}/night',
              style:
                  AppStyles.headLineStyle1.copyWith(color: AppStyles.kakiColor),
            ),
          )
        ],
      ),
    );
  }
}