import 'dart:io';
import 'package:ejemplo_1/data/services/peticionesarticulo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CrearArticulos extends StatefulWidget {
  const CrearArticulos({Key? key}) : super(key: key);

  @override
  State<CrearArticulos> createState() => _CrearArticulosState();
}

class _CrearArticulosState extends State<CrearArticulos> {
  var _image;
  TextEditingController controlCodigo = TextEditingController();
  TextEditingController controlDetalle = TextEditingController();
  TextEditingController controlMarca = TextEditingController();
  TextEditingController controlMedida = TextEditingController();
  TextEditingController controlCantBodega = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Articulos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(48),
                          child: Image.file(
                            _image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(48),
                          ),
                          width: 100,
                          height: 100,
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
            TextField(
              controller: controlCodigo,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Ingrese el Codigo'),
            ),
            TextField(
              controller: controlDetalle,
              decoration:
                  const InputDecoration(labelText: 'Ingrese el Detalle'),
            ),
            TextField(
              controller: controlMarca,
              decoration: const InputDecoration(labelText: 'Ingrese la Marca'),
            ),
            TextField(
              controller: controlMedida,
              decoration: const InputDecoration(
                  labelText: 'Ingrese la Unidad de Medida'),
            ),
            TextField(
              controller: controlCantBodega,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Ingrese la Cantidad en Bodega'),
            ),
            ElevatedButton(
                onPressed: () {
                  var catalogo = <String, dynamic>{
                    'idArticulo': controlCodigo.text,
                    'detalle': controlDetalle.text,
                    'marca': controlMarca.text,
                    'medida': controlMedida.text,
                    'cantBodega': controlCantBodega.text,
                    'foto': ''
                  };

                  PeticionesArticulo.crearArticulo(catalogo, _image);
                },
                child: const Text("Guardar Articulo"))
          ],
        ),
      ),
    );
  }
}
