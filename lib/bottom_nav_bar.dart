
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/screens/home/home_screen.dart';
import 'package:ticket_app/screens/search/search_screen.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  // to show different screens in app using index
  final appScreens = [
    const  HomeScreen(),
    const  SearchScreen(),
    const  TicketScreen(),
    const Center(child:  Text('Person')),
  ];

  int _selectedItem = 0;
  void _onItemTapped(int index){
    // this function selects the tapped item and assigns it's value to _selectedItem variable
    setState(() {
      _selectedItem = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // here _selectedItem variable is given to appScreens list as an index to show the respective screen
      body: appScreens[_selectedItem],

      bottomNavigationBar: BottomNavigationBar(
        // clicking on this onTap calls _onItemTapped function which give them the index of item being tapped
        onTap: _onItemTapped,
        // currentIndex is used to change the Icon from regular to filled
        currentIndex: _selectedItem,
        selectedItemColor: Colors.blueGrey,
        showSelectedLabels: false,
        unselectedItemColor: const Color(0xFF526400),
        items: const[
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: 'home'),

          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: 'search'),

          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
              label: 'home'),

          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: 'home'),



        ],
      ),
    );
  }
}
