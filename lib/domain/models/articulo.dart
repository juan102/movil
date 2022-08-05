import 'package:flutter/foundation.dart';

class Articulo {
  final String idArticulo;
  final String detalle;
  final String marca;
  final String medida;
  final String cantBodega;
  final String foto;

  Articulo(
      {required this.idArticulo,
      required this.detalle,
      required this.marca,
      required this.medida,
      required this.cantBodega,
      required this.foto});

  factory Articulo.desdeDoc(Map<String, dynamic> data) {
    return Articulo(
        idArticulo: data['idArticulo'],
        detalle: data['detalle'],
        marca: data['marca'],
        medida: data['medida'],
        cantBodega: data['cantBodega'],
        foto: data['foto']);
  }
}
