import 'package:flutter/material.dart';
import 'package:proyecto/Views/invoices.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true; // Controla la visibilidad de la contraseña

  final String _staticUsername = "usuario";
  final String _staticPassword = "contraseña";

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_usernameController.text == _staticUsername &&
          _passwordController.text == _staticPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login exitoso')),
        );
        // Navegar a la pantalla de facturas después de un login exitoso
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => InvoicesPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Credenciales incorrectas')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/images/restaurant.jpg', // Ruta de la imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          // Contenido de la pantalla de login
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Icono de login
                    Icon(
                      Icons.account_circle_sharp,
                      size: 120,
                      color: Color.fromARGB(255, 201, 184, 160),
                    ),
                    SizedBox(height: 20),

                    // Formulario de login
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          // Campo de Usuario
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Usuario',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                //fontWeight: FontWeight.bold,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 107, 126, 207).withOpacity(0.4),
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese un usuario';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
                          // Campo de Contraseña
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                //fontWeight: FontWeight.bold,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 107, 126, 207).withOpacity(0.3),
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese una contraseña';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          // Botón de Iniciar sesión
                          ElevatedButton(
                            onPressed: _login,
                            child: Text('Iniciar sesión'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue,
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(double.infinity, 48), // Ancho completo y altura ajustada
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          // Botón de Registro
                          TextButton(
                            onPressed: () {
                              // Navegar a la pantalla de registro
                            },
                            child: Text(
                              'No tienes una cuenta? Regístrate',
                              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
