import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/app_routes.dart';
import 'package:ticket_app/res/media.dart';
import 'package:ticket_app/res/styles/app_styles.dart';
import 'package:ticket_app/screens/widgets/hotels.dart';
import 'package:ticket_app/utills/all_json.dart';
import 'package:ticket_app/widgets/ticket_view.dart';
import '../../widgets/app_double_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      //ListView is used instead of column or something because we want to make it scrollable
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  // good morning section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good Morning', style: AppStyles.headLineStyle3),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Book Tickets',
                        style: AppStyles.headLineStyle1,
                      )
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          // 'assets/images/logo.png'
                          image: AssetImage(AppMedia.logo),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              // search section
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFF4F6FD),
                ),
                child: const Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      FluentSystemIcons.ic_fluent_search_regular,
                      color: Color(0xFFBFC205),
                    ),
                    Text('Search'),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              AppDoubleText(
                bigText: 'Upcoming Flights',
                smallText: 'View All',
                func: () => Navigator.pushNamed(context, '/all_tickets'),
              ),
              const SizedBox(
                height: 20,
              ),
              // scrollable ticket section
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ticketList
                        .map((SingleTicket) => TicketView(ticket: SingleTicket))
                        .toList(),
                  )),
              const SizedBox(
                height: 40,
              ),
              AppDoubleText(
                bigText: 'Hotels',
                smallText: 'View All',
                func: () {
                  Navigator.pushNamed(context, AppRoutes.allHotels);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // scrollable hotel section
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: hotelList
                        .map((singleHotel) => Hotel(hotel: singleHotel))
                        .toList(),
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
