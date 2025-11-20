import 'package:flutter/material.dart';
import 'package:myflutter_nov2025/app/views/contacts.screen.dart';
import 'package:myflutter_nov2025/app/views/layout.dart';
import 'package:myflutter_nov2025/app/views/reports.screen.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const LayoutDemo(),
        const ContactsScreen(),
        ReportScreen()
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white,),
            icon: Icon(Icons.home_outlined), 
            label: 'Home'
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.contacts, color: Colors.white,),
            icon: Icon(Icons.contacts_outlined), 
            label: 'Contacts'
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.article, color: Colors.white,),
            icon: Icon(Icons.article_outlined), 
            label: 'Reports'
          ),
        ]
      ),
    );
  }
}