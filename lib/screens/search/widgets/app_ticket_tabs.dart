import 'package:flutter/material.dart';

class AppTicketTabs extends StatelessWidget {
  final String tab1Text;
  final String tab2Text;

  const AppTicketTabs({super.key, required this.tab1Text, required this.tab2Text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Color(0xFFF4F6FD)),
      child: Row(
        children: [
          AppTabs(
            tabText: tab1Text,
          ),
          AppTabs(
            tabText: tab2Text,
            tabBorder: true,
            tabColor: true,
          ),
        ],
      ),
    );
  }
}

class AppTabs extends StatelessWidget {
  const AppTabs(
      {super.key,
      this.tabText = "",
      this.tabBorder = false,
      this.tabColor = false});
  final String tabText;
  final bool tabBorder;
  final bool tabColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      width: size.width * 0.44,
      decoration: BoxDecoration(
        borderRadius: tabBorder == false
            ? BorderRadius.horizontal(left: Radius.circular(50))
            : BorderRadius.horizontal(right: Radius.circular(50)),
        color: tabColor == false ? Colors.white : Colors.transparent,
      ),
      child: Center(child: Text(tabText)),
    );
  }
}
