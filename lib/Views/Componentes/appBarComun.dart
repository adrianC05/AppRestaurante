import 'package:flutter/material.dart';
import 'package:proyecto/Views/scanner_screen.dart';

class AppBarComun extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String tableNumber;

  AppBarComun({required this.title, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ScannerScreen()), // Reemplaza 'ScannerScreen' con tu widget de escáner inicial
            (Route<dynamic> route) => false,
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text('Nro. Mesa $tableNumber',
                style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 226, 186, 186))),
          ),
        ),
      ],
      backgroundColor: Colors.deepPurple,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CommonBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CommonBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Pedido',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label: 'Factura',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      onTap: onTap,
      backgroundColor: Colors.deepPurple,
    );
  }
}
