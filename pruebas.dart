import 'package:flutter/material.dart';
import 'package:proyecto/Views/Empleados/AppBarEmpleados.dart';
import 'package:proyecto/Views/Empleados/commonBottomNavigationBarEmpleados.dart';
import 'package:proyecto/Views/Empleados/crear_plato.dart';
import 'package:proyecto/Views/Empleados/factura_view.dart';
import 'package:proyecto/Views/Empleados/menuEmpleados.dart'; // Importa la página MenuEmpleados

class HomeScreenEmpleados extends StatefulWidget {
  @override
  _HomeScreenEmpleadosState createState() => _HomeScreenEmpleadosState();
}

class _HomeScreenEmpleadosState extends State<HomeScreenEmpleados> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      InvoicesPage(),
      MenuEmpleados(),
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
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Facturas' : 'Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ManagePlatosPage(), // Navega a la pantalla de gestión de platos
                ),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CommonBottomNavigationBarEmpleados(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
