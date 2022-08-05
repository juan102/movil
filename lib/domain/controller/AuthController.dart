import 'package:ejemplo_1/data/services/peticionesUser.dart';
import 'package:ejemplo_1/domain/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final Rxn<List<User>> _users = Rxn<List<User>>();

  List<User>? get users => _users.value;

  Future<void> enviarDatos(http.Client client, String user, String pass) async {
    _users.value = await PeticionUser.validarUser(client, user, pass);
  }

  Future<void> GuardarDatos(http.Client client, String user, String pass,
      String nombre, String rol) async {
    _users.value =
        await PeticionUser.guardarUser(client, user, pass, nombre, rol);
  }
}
