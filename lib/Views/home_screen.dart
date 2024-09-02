import 'package:flutter/material.dart';
import 'package:proyecto/Views/menu.dart';
import 'package:proyecto/Views/carrito.dart';
import 'package:proyecto/Views/factura.dart';
import 'package:proyecto/Views/Componentes/appBarComun.dart';

class HomeScreen extends StatefulWidget {
  final String tableNumber;

  HomeScreen({required this.tableNumber});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      Menu(tableNumber: widget.tableNumber),
      Carrito(tableNumber: widget.tableNumber, onPedir: () => _onItemTapped(2)),
      Factura(tableNumber: widget.tableNumber),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComun(
        title: _selectedIndex == 0
            ? 'Restaurante'
            : _selectedIndex == 1
                ? 'Carrito'
                : 'Factura',
        tableNumber: widget.tableNumber,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CommonBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
