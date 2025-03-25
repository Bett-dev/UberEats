import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urban_eats/constants/const.dart';
import 'package:urban_eats/pages/homepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  final List<Widget> screens = [
    Homepage(),
    Center(child: Text('Messages Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Explore Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        backgroundColor: Colors.white,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          buildNavItem(
            icon: Icons.home_outlined,
            selectedIcon: Icons.home_filled,
            label: 'Home',
          ),
          buildNavItem(
            icon: CupertinoIcons.chat_bubble_text,
            selectedIcon: CupertinoIcons.chat_bubble_text_fill,
            label: 'Message',
          ),
          buildNavItem(
            icon: CupertinoIcons.compass,
            selectedIcon: CupertinoIcons.chat_bubble_text_fill,
            label: 'Home',
          ),
          buildNavItem(
            icon: Icons.person_outline_rounded,
            selectedIcon: Icons.person_rounded,
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(index: currentPageIndex, children: screens),
    );
  }

  NavigationDestination buildNavItem({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
  }) {
    return NavigationDestination(
      icon: Icon(icon),
      label: label,
      selectedIcon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(selectedIcon, color: kBlack),
          Container(
            width: 8,
            height: 8,
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(shape: BoxShape.circle, color: kBlack),
          ),
        ],
      ),
    );
  }
}
