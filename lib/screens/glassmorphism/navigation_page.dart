import 'package:flutter/material.dart';
import 'package:neumorohism_app/screens/glassmorphism/card_payment.dart';
import 'package:neumorohism_app/screens/glassmorphism/tradepage.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int selectedIndex = 0;
  List pages = [CardPayment(), TradePage(), CardPayment()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: selectedIndex,
          unselectedItemColor: Colors.white24,
          selectedItemColor: Colors.white,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 40,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  size: 40,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_sharp,
                  size: 40,
                ),
                label: "")
          ]),
      body: Center(
        child: (pages[selectedIndex]),
      ),
    );
  }
}
