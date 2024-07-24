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
        // Aquí podrías navegar a otra pantalla si lo deseas
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Icono de login
                  Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20),

                  // Formulario de login
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
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
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock, color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
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
                        ElevatedButton(
                          onPressed: _login,
                          child: Text('Iniciar sesión'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            minimumSize: MaterialStateProperty.all<Size>(
                                Size(double.infinity, 36)), // Ancho completo
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navegar a la pantalla de registro
                          },
                          child: Text(
                            'No tienes cuenta? Regístrate',
                            style: TextStyle(color: Colors.white),
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
      ),
    );
  }
}
