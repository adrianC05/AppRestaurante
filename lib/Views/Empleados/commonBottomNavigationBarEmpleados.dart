import 'package:flutter/material.dart';

class CommonBottomNavigationBarEmpleados extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CommonBottomNavigationBarEmpleados({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label: 'Facturas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Menu',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      onTap: (index) {
        print("Navegando al índice: $index");
        onTap(index);
      },
      backgroundColor: Colors.deepPurple,
    );
  }
}
