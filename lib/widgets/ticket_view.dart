import 'package:flutter/material.dart';
import 'package:ticket_app/res/styles/app_styles.dart';
import 'package:ticket_app/widgets/app_layout_builder_widget.dart';
import 'package:ticket_app/widgets/big_circles.dart';
import 'package:ticket_app/widgets/big_dots.dart';
import 'package:ticket_app/widgets/text_style-fourth.dart';
import 'package:ticket_app/widgets/text_style_third.dart';

import 'app_column_text_layout.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView(
      {super.key,
      required this.ticket,
      this.wholeScreen = false,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 190,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
        child: Column(
          children: [
            // Blue area of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor == null
                      ? AppStyles.ticketBlue
                      : AppStyles.ticketColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Column(
                children: [
                  //show departure and destination with icons first line
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyleThird(
                        text: ticket['from']['code'],
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      BigDots(isColor: isColor),
                      Expanded(
                          child: Stack(
                        children: [
                           SizedBox(
                            height: 24,
                            child: AppLayoutBuilderWidget(
                              randomDivider: 5,
                              isColor: isColor,
                            ),
                          ),
                          Center(
                              child: Transform.rotate(
                                  angle: 1.57,
                                  child: Icon(
                                    Icons.local_airport_rounded,
                                    color: isColor == null
                                        ? Colors.white
                                        : AppStyles.planeSecondColor,
                                  ))),
                        ],
                      )),
                      BigDots(isColor: isColor),
                      Expanded(child: Container()),
                      TextStyleThird(
                        text: ticket['to']['code'],
                        isColor: isColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  // show departure and destination names with time
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: ticket['from']['name'],
                          isColor: isColor,
                        ),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(text: ticket['flying_time'],
                      isColor: isColor,
                      ),

                      Expanded(child: Container()),
                      SizedBox(
                          width: 100,
                          child: TextStyleFourth(
                              text: ticket['to']['name'],
                              isColor: isColor,
                              align: TextAlign.end)),
                    ],
                  ),
                ],
              ),
            ),
            // circles and dots area
            Container(
              color: isColor== null? AppStyles.ticketOrange : AppStyles.ticketColor,
              child:  Row(
                children: [
                  BigCircles(isRight: false,
                  isColor: isColor,
                  ),
                   Expanded(
                      child: AppLayoutBuilderWidget(
                    randomDivider: 16,
                    width: 6,
                        isColor: isColor,
                  )),
                  BigCircles(isRight: true,
                  isColor: isColor,
                  ),
                ],
              ),
            ),
            // orange area of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor == null? AppStyles.ticketOrange : AppStyles.ticketColor,
                  borderRadius:  BorderRadius.only(
                      bottomLeft: Radius.circular(isColor==null?21:0),
                      bottomRight: Radius.circular(isColor==null?21:0))),
              child: Column(
                children: [
                  //show departure and destination with icons first line
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(
                        topText: ticket['date'],
                        bottomText: 'DATE',
                        alignment: CrossAxisAlignment.start,
                        isColor: isColor
                      ),
                      AppColumnTextLayout(
                        topText: ticket['departure_time'],
                        bottomText: 'Departure Time',
                        alignment: CrossAxisAlignment.center,
                        isColor: isColor,
                      ),
                      AppColumnTextLayout(
                        topText: ticket['number'].toString(),
                        bottomText: 'Number',
                        alignment: CrossAxisAlignment.end,
                        isColor: isColor
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
