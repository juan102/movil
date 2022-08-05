import 'package:ejemplo_1/data/services/peticionesarticulo.dart';
import 'package:ejemplo_1/domain/models/articulo.dart';
import 'package:get/get.dart';

class ConsultasController extends GetxController {
  final Rxn<List<Articulo>> _articuloFirestore = Rxn<List<Articulo>>();

  Future<void> consultaArticulos() async {
    _articuloFirestore.value = await PeticionesArticulo.consultaGral();
  }

  List<Articulo>? get getArticulosGral => _articuloFirestore.value;
}
