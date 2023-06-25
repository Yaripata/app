import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutter/material.dart';
import 'package:lulu_app/auth_services/auth_services.dart';
import 'package:lulu_app/componentes/cuadradoConImagen.dart';

class Auth extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sesion"),
      ),
      body: Center(
        child: Form(
            child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Contraseña',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.length > 6) {
                    login();
                  } else {
                    debugPrint("Error al logearse");
                  }
                },
                child: const Text("Entrar")),
            TextButton(
                onPressed: () {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.length > 6) {
                    register();
                  } else {
                    debugPrint("Error al logearse");
                  }
                },
                child: const Text("Registrarse")),
            const Text("O conectate con:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CuadradoConImagen(
                    pathimagen: "lib/images/google.png",
                    onTap: () => AuthService().signInWithGoogle()),
                const SizedBox(
                  width: 25,
                ),
                CuadradoConImagen(
                    pathimagen: "lib/images/google.png",
                    onTap: () => AuthService().signInWithFacebook())
              ],
            )
          ],
        )),
      ),
    );
  }

  Future<void> login() async {
    final auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  Future<void> register() async {
    final auth = FirebaseAuth.instance;
    auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }
}
