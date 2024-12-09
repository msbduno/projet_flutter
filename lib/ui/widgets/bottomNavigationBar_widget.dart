// lib/ui/widgets/custom_bottom_navigation_bar.dart
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Liste',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Carte',
        ),
      ],
      currentIndex: currentIndex,
    onTap: (index) {
    if (index == 0) {
    Navigator.pushNamed(context, '/home');
    } else if (index == 1) {
    Navigator.pushNamed(context, '/home_map');
    }
    },
    );
  }
}