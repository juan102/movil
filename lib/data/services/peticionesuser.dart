import 'dart:convert';
import 'package:ejemplo_1/domain/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PeticionUser {
  static Future<List<User>> validarUser(
      http.Client client, String user, String pass) async {
    var url = Uri.parse(
        "https://desarolloweb2021a.000webhostapp.com/APIMOVIL/listaruser.php");

    final response = await http.post(url, body: {
      'user': user,
      'pass': pass,
    });

    return compute(pasarAlista, response.body);
  }

  static Future<List<User>> guardarUser(http.Client client, String user,
      String pass, String nombre, String rol) async {
    var url = Uri.parse(
        "https://desarolloweb2021a.000webhostapp.com/APIMOVIL/agregarUser.php");

    final response = await http.post(url,
        body: {'user': user, 'pass': pass, 'nombre': nombre, 'rol': rol});

    return compute(pasarAlista, response.body);
  }

  static List<User> pasarAlista(String responseBody) {
    final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();
    return pasar.map<User>((json) => User.desdeJson(json)).toList();
  }
}
