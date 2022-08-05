import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejemplo_1/domain/models/articulo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;

class PeticionesArticulo {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> crearArticulo(Map<String, dynamic> catalogo, foto) async {
    var url = '';
    if (foto != null) {
      url = await cargarfoto(foto, catalogo['idArticulo']);
    }

    catalogo['foto'] = url.toString();

    await _db
        .collection('Articulos')
        .doc(catalogo['idArticulo'])
        .set(catalogo)
        .catchError((e) {});
  }

  static Future<dynamic> cargarfoto(var foto, var idArt) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("Articulos");
    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(idArt).putFile(foto);
    var url = await taskSnapshot.ref.getDownloadURL();

    return url.toString();
  }

  static Future<void> actualizarArticulo(
      String id, Map<String, dynamic> catalogo) async {
    await _db.collection('Articulos').doc(id).update(catalogo).catchError((e) {
      log(e);
    });
  }

  static Future<void> eliminarCatalogo(String id) async {
    await _db.collection('Articulos').doc(id).delete().catchError((e) {
      log(e);
    });
  }

  static Future<List<Articulo>> consultaGral() async {
    List<Articulo> lista = [];
    await _db.collection("Articulos").get().then((respuesta) {
      for (var doc in respuesta.docs) {
        log(doc.data().toString());
        lista.add(Articulo.desdeDoc(doc.data()));
      }
    });

    return lista;
  }
}
