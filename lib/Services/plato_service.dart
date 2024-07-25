import 'package:proyecto/Models/plato.dart';

class PlatoService {
  List<Plato> getPlatos() {
    return [
      Plato(
        name: 'Platillo 1',
        imageUrl:
            'https://th.bing.com/th/id/OIP.SBqHh-QSguZI0cFtgYHUJgHaE7?rs=1&pid=ImgDetMain',
        price: 10.0,
        description: 'Descripción del platillo 1',
      ),
      Plato(
        name: 'Platillo 2',
        imageUrl:
            'https://unareceta.com/wp-content/uploads/2016/10/pollo-asado.jpg',
        price: 12.0,
        description: 'Descripción del platillo 2',
      ),
      Plato(
        name: 'Platillo 3',
        imageUrl:
            'https://3.bp.blogspot.com/-0oTrqBs4X6k/VMfN0Soc2zI/AAAAAAAAAEw/XSOp0ZAR36o/s1600/restaurantes-el-palacio-de-la-fritada-guia-enquito-4.jpg',
        price: 12.0,
        description: 'Descripción del platillo 2',
      ),
      Plato(
        name: 'Platillo 4',
        imageUrl:
            'https://th.bing.com/th/id/OIP.etMozSoAMKlgMpalx8KQhwHaE8?rs=1&pid=ImgDetMain',
        price: 12.0,
        description: 'Descripción del platillo 2',
      ),
      // Más platillos aquí
    ];
  }
}
