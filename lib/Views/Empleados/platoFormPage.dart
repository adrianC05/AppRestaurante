import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto/Models/plato.dart';
import 'package:proyecto/Services/plato_service.dart';
import 'package:proyecto/Views/Empleados/crear_plato.dart';

class PlatoFormPage extends StatefulWidget {
  final Plato? plato;

  PlatoFormPage({this.plato});

  @override
  _PlatoFormPageState createState() => _PlatoFormPageState();
}

class _PlatoFormPageState extends State<PlatoFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final PlatoService _platoService = PlatoService();
  File? _imageFile;
  String? _imageUrl;
  bool _isLoading = false; // Indicador de carga

  @override
  void initState() {
    super.initState();
    if (widget.plato != null) {
      _nameController.text = widget.plato!.name;
      _imageUrl = widget.plato!.imageUrl;
      _priceController.text = widget.plato!.price.toString();
      _descriptionController.text = widget.plato!.description;
    }
  }

  Future<void> _pickImage() async {
    if (_isLoading) return; // Prevenir múltiples llamadas simultáneas

    setState(() {
      _isLoading = true;
    });

    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null && mounted) {
        // Verificar si el widget sigue montado
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      } else {
        print("No se seleccionó ninguna imagen.");
      }
    } finally {
      if (mounted) {
        // Verificar si el widget sigue montado
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plato == null ? 'Agregar Plato' : 'Editar Plato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre del Plato'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del plato';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: _pickImage,
                child: _isLoading
                    ? CircularProgressIndicator() // Mostrar indicador de carga mientras se selecciona la imagen
                    : _imageFile == null
                        ? _imageUrl == null
                            ? Icon(Icons.image, size: 100)
                            : Image.network(_imageUrl!, height: 100)
                        : Image.file(_imageFile!, height: 100),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el precio del plato';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la descripción del plato';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _savePlato,
                child: Text(widget.plato == null ? 'Agregar' : 'Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _savePlato() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("Guardando plato..."),
                ],
              ),
            ),
          );
        },
      );

      final String name = _nameController.text;
      final double price = double.parse(_priceController.text);
      final String description = _descriptionController.text;

      if (_imageFile != null) {
        // Subir la imagen
        _imageUrl = await _platoService.uploadImage(_imageFile!.path);
        print("URL de la imagen: $_imageUrl");
      }

      if (widget.plato == null) {
        // Añadir un nuevo plato
        await _platoService.addPlato(
          Plato(
            id: '',
            name: name,
            imageUrl: _imageUrl!,
            price: price,
            description: description,
          ),
          imagePath: _imageFile!.path,
        );
      } else {
        // Actualizar un plato existente
        await _platoService.updatePlato(
          widget.plato!,
          newImagePath: _imageFile != null ? _imageFile!.path : null,
        );
      }

      Navigator.of(context).pop(); // Cerrar el diálogo

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ManagePlatosPage(),
          ),
        );
      }
    }
  }
}
