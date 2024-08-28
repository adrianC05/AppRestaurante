import 'package:proyecto/Models/plato.dart';

class PlatoService {
  List<Plato> _platos = [
    Plato(
      name: 'Platillo 1',
      imageUrl:
          'https://th.bing.com/th/id/OIP.SBqHh-QSguZI0cFtgYHUJgHaE7?rs=1&pid=ImgDetMain',
      price: 10.0,
      description: 'Descripción del platillo 1',
    ),
    // Otros platos...
  ];

  List<Plato> getPlatos() {
    return _platos;
  }

  void addPlato(Plato plato) {
    _platos.add(plato);
  }

  void updatePlato(Plato oldPlato, Plato newPlato) {
    final index = _platos.indexOf(oldPlato);
    if (index != -1) {
      _platos[index] = newPlato;
    }
  }

  void deletePlato(Plato plato) {
    _platos.remove(plato);
  }
}
