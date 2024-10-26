import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/res/media.dart';
import 'package:ticket_app/res/styles/app_styles.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/utills/all_json.dart';
import 'package:ticket_app/widgets/app_column_text_layout.dart';
import 'package:ticket_app/widgets/app_layout_builder_widget.dart';
import 'package:ticket_app/widgets/ticket_view.dart';

import 'widgets/ticket_positioined_circles.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex =0;
  @override
  void didChangeDependencies() {
    // var args = ModalRoute.of(context)!.settings.arguments as Map;
    final args = ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>?;
    // ticketIndex = args['index'];
    if (args != null && args.containsKey('index')) {
      ticketIndex = args['index'] as int; // Cast to int or use the correct type
    } else {
      // Handle missing or invalid arguments
      print('No valid arguments passed');
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: const Text('Tickets'),
        backgroundColor: AppStyles.bgColor,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            children: [
              // const SizedBox(
              //   height: 40,
              // ),
              // Text(
              //   'Tickets',
              //   style: AppStyles.headLineStyle1,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              const AppTicketTabs(
                tab1Text: "Upcoming",
                tab2Text: "Previous",
              ),
              const SizedBox(
                height: 20,
              ),
              // this contains the whole ticket in white background color. 1st portion of screen after upcoming / previous
              Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: TicketView(ticket: ticketList[ticketIndex], isColor: true)),
              const SizedBox(
                height: 1,
              ),
              // this container contains a column which contains three row for these three sections
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: AppStyles.ticketColor,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: 'Flutter DB',
                          bottomText: 'Passenger',
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: '4352 76929',
                          bottomText: 'Passport',
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppLayoutBuilderWidget(
                      randomDivider: 15,
                      isColor: false,
                      width: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: '3425 0987699',
                          bottomText: 'Number of E-Ticket',
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: 'B46i59',
                          bottomText: 'Booking Code',
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppLayoutBuilderWidget(
                      randomDivider: 15,
                      isColor: false,
                      width: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                const Image(
                                  image: ExactAssetImage(AppMedia.visaCard,
                                      scale:
                                          11), // Move scale to the Image widget
                                ),
                                Text(' *** 24462',
                                    style: AppStyles.headLineStyle3)
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Payment Method',
                              style: AppStyles.headLineStyle4,
                            )
                          ],
                        ),
                        const AppColumnTextLayout(
                          topText: '\$289.99',
                          bottomText: 'Price',
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              // this container contains QR code section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: AppStyles.ticketColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21),
                    )),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      height: 70,
                      barcode: Barcode.code128(),
                      data: 'https://dbesttech.com',
                      drawText: false,
                      color: AppStyles.textColor,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // colorful ticket
              Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: TicketView(
                    ticket: ticketList[ticketIndex],
                  )),
            ],
          ),
          const TicketPositionedCircles(
            pos: true,
          ),const TicketPositionedCircles(
            pos: false,
          ),

        ],
      ),
    );
  }
}
