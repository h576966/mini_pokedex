
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.white) , label: 'Find', ), BottomNavigationBarItem(icon: Icon(Icons.home,  color: Colors.white) , label: 'Home') ], backgroundColor: Colors.black,);
  }
}
