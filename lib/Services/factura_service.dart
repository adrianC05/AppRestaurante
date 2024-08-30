import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto/Models/factura_model.dart';

class InvoiceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveInvoice(FacturaModel factura) async {
    await _firestore.collection('facturas').add(factura.toFirestore());
  }

  Future<List<FacturaModel>> fetchInvoices() async {
    QuerySnapshot querySnapshot = await _firestore.collection('facturas').get();
    return querySnapshot.docs
        .map((doc) => FacturaModel.fromFirestore(doc))
        .toList();
  }
}
