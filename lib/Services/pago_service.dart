import 'package:proyecto/models/pago_model.dart';

class PagoService {
  Future<List<Pago>> fetchPagos() async {
    // Aquí se simulan algunos datos, en un caso real esto vendría de una API
    return [
      Pago(tableNumber: "1", total: 50.0, isPaid: true),
      Pago(tableNumber: "2", total: 75.0, isPaid: false),
      Pago(tableNumber: "3", total: 120.5, isPaid: true),
      Pago(tableNumber: "4", total: 30.0, isPaid: false),
    ];
  }
}
