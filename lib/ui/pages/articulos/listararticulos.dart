import 'dart:io';
import 'package:ejemplo_1/data/services/peticionesarticulo.dart';
import 'package:ejemplo_1/domain/controller/articulosController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListarArticulos extends StatelessWidget {
  const ListarArticulos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConsultasController controladorArticulo = Get.find();
    controladorArticulo.consultaArticulos().then((value) => null);
    return Scaffold(
      body: Obx(
        () => controladorArticulo.getArticulosGral?.isEmpty == false
            ? ListView.builder(
                itemCount: controladorArticulo.getArticulosGral?.isEmpty == true
                    ? 0
                    : controladorArticulo.getArticulosGral!.length,
                itemBuilder: (context, posicion) {
                  return ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(5),
                      width: 50,
                      height: 50,
                      child: Image.network(
                        controladorArticulo.getArticulosGral![posicion].foto,
                      ),
                    ),
                    title: Text(controladorArticulo
                        .getArticulosGral![posicion].detalle),
                    subtitle: Text(
                        controladorArticulo.getArticulosGral![posicion].marca),
                    trailing: Container(
                      width: 80,
                      height: 40,
                      color: Colors.yellow,
                      child: Text(controladorArticulo
                          .getArticulosGral![posicion].cantBodega),
                    ),
                  );
                },
              )
            : const Icon(Icons.abc),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
