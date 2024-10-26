
import 'package:flutter/material.dart';
import 'package:ticket_app/app_routes.dart';
import 'package:ticket_app/screens/home/all_hotels.dart';
import 'package:ticket_app/screens/home/all_tickets.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';

import 'bottom_nav_bar.dart';
import 'screens/hotel_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.homepage: (context)=> const BottomNavBar(),
        AppRoutes.allTickets : (context) => const AllTickets(),
        AppRoutes.ticketScreen : (context) => const TicketScreen(),
        AppRoutes.allHotels : (context) => const AllHotels(),
        AppRoutes.hotelDetail: (context)=> const HotelDetail()
      },
    );
  }
}
