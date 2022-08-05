import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../domain/controller/AuthController.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controlUser = TextEditingController();
  TextEditingController controlPass = TextEditingController();
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlRol = TextEditingController();
  AuthController controllerUser = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://login.gov/assets/img/login-gov-288x288.png'),
              ),
              TextField(
                controller: controlUser,
                decoration: const InputDecoration(labelText: 'Ingrese usuario'),
              ),
              TextField(
                controller: controlNombre,
                decoration:
                    const InputDecoration(labelText: 'Ingrese el nombre'),
              ),
              TextField(
                controller: controlPass,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Ingrese la Contraseña'),
              ),
              TextField(
                controller: controlRol,
                decoration: const InputDecoration(labelText: 'Ingrese el rol '),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        controllerUser.GuardarDatos(
                                http.Client(),
                                controlUser.text,
                                controlPass.text,
                                controlNombre.text,
                                controlRol.text)
                            .then((value) => {
                                  if (controllerUser.users?.isNotEmpty == true)
                                    {
                                      Get.showSnackbar(
                                        const GetSnackBar(
                                          title: 'exito',
                                          message: 'Se guardo el vale',
                                          icon: Icon(Icons.warning),
                                          duration: Duration(seconds: 2),
                                        ),
                                      )
                                    }
                                  else
                                    {
                                      Get.showSnackbar(
                                        const GetSnackBar(
                                          title: 'Error',
                                          message: 'Verificar campos',
                                          icon: Icon(Icons.warning),
                                          duration: Duration(seconds: 2),
                                        ),
                                      )
                                    }
                                });
                      },
                      child: const Text('Registrar'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
