import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:proyecto/Models/plato.dart';

class PlatoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Stream<List<Plato>> getPlatos() {
    return _firestore.collection('menu').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Plato.fromFirestore(doc)).toList());
  }

  Future<void> addPlato(Plato plato, {required String imagePath}) async {
    // Upload the image to Firebase Storage
    String imageUrl = await uploadImage(imagePath);

    // Add the plato to Firestore
    await _firestore.collection('menu').add({
      'nombre': plato.name,
      'imagen': imageUrl,
      'precio': plato.price,
      'descripcion': plato.description,
    });
  }

  Future<void> updatePlato(Plato plato, {String? newImagePath}) async {
    String imageUrl = plato.imageUrl;

    if (newImagePath != null) {
      // Update image in Firebase Storage
      imageUrl = await uploadImage(newImagePath);
    }

    // Update the plato in Firestore
    await _firestore.collection('menu').doc(plato.id).update({
      'nombre': plato.name,
      'imagen': imageUrl,
      'precio': plato.price,
      'descripcion': plato.description,
    });
  }

  Future<void> deletePlato(Plato plato) async {
    // Delete the image from Firebase Storage
    await _storage.refFromURL(plato.imageUrl).delete();

    // Delete the plato from Firestore
    await _firestore.collection('menu').doc(plato.id).delete();
  }

  Future<String> uploadImage(String imagePath) async {
    Reference storageRef = _storage
        .ref()
        .child('platos/${DateTime.now().millisecondsSinceEpoch}.jpg');
    UploadTask uploadTask = storageRef.putFile(File(imagePath));
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }
}
