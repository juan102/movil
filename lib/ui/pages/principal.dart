import 'package:ejemplo_1/domain/controller/AuthController.dart';
import 'package:ejemplo_1/ui/pages/articulos/listararticulos.dart';
import 'package:ejemplo_1/ui/pages/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  AuthController controllerUser = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Menu Principal"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.verified_user),
            ),
            Tab(
              icon: Icon(Icons.checklist),
            ),
          ]),
        ),
        body: const TabBarView(children: [
          ListarArticulos(),
          ListarArticulos(),
        ]),
      ),
    );
  }
}
