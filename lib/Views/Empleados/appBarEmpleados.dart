// views/Empleados/app_bar_empleados.dart
import 'package:flutter/material.dart';
import 'package:proyecto/Views/login_view.dart';

class AppBarEmpleados extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  AppBarEmpleados({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false,
          );
        },
      ),
      backgroundColor: Colors.deepPurple,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
