// services/invoice_service.dart
import 'package:proyecto/models/factura_model.dart';

class InvoiceService {
  Future<List<Invoice>> fetchInvoices() async {
    // Simulando la obtención de datos desde una API o base de datos
    await Future.delayed(Duration(seconds: 2)); // Simulando un retraso
    return [
      Invoice(
        invoiceNumber: '01',
        amount: '9.99',
        products: [
          Product(name: 'Producto 2', imagePath: 'assets/images/item2.jpg', price: '19.99'),
          Product(name: 'Producto 3', imagePath: 'assets/images/item3.jpg', price: '29.99'),
        ],
      ),
      Invoice(
        invoiceNumber: '02',
        amount: '19.99',
        products: [
          Product(name: 'Producto 3', imagePath: 'assets/images/item3.jpg', price: '29.99'),
          Product(name: 'Producto 2', imagePath: 'assets/images/item2.jpg', price: '19.99'),
          Product(name: 'Producto 1', imagePath: 'assets/images/item1.jpg', price: '9.99'),
        ],
      ),
    ];
  }
}
