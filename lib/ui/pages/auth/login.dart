import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../domain/controller/AuthController.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controlUser = TextEditingController();
  TextEditingController controlPass = TextEditingController();
  AuthController controllerUser = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                decoration:
                    const InputDecoration(labelText: 'Ingrese el Usuario'),
              ),
              TextField(
                controller: controlPass,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Ingrese la Contraseña'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        controllerUser
                            .enviarDatos(http.Client(), controlUser.text,
                                controlPass.text)
                            .then((value) => {
                                  if (controllerUser.users?.isNotEmpty == true)
                                    {Get.offNamed('/Principal')}
                                  else
                                    {
                                      Get.showSnackbar(
                                        const GetSnackBar(
                                          title: 'Error',
                                          message: 'Verificar credenciales',
                                          icon: Icon(Icons.warning),
                                          duration: Duration(seconds: 2),
                                        ),
                                      )
                                    }
                                });
                      },
                      icon: const Icon(Icons.login)),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.toNamed('/register');
                      },
                      icon: const Icon(Icons.app_registration))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
