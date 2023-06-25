import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AgendaBoton extends StatelessWidget {
  final String title;
  final String route;

  const AgendaBoton({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SafeArea(
            top: false,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 298.0,
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      color: const Color.fromARGB(255, 219, 130, 235),
                      child: InkWell(
                          splashColor: Colors.purple,
                          onTap: () {
                            Navigator.of(context).pushNamed(route);
                          },
                          child: const Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.calendar_month),
                                title: Text(
                                    "12:34  evento prox DD-MM\n12:34  evento prox DD-MM"),
                                subtitle: Text("Agenda"),
                                minVerticalPadding: 8.0,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}

class ContactoBoton extends StatelessWidget {
  final String title;
  final String route;

  const ContactoBoton({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SafeArea(
            top: false,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 200.0,
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      color: Colors.yellow,
                      child: InkWell(
                          splashColor: Colors.yellowAccent,
                          onTap: () {
                            Navigator.of(context).pushNamed(route);
                          },
                          child: const Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.contact_page),
                                title:
                                    Text(" persona 1,\n persona 2\n persona 3"),
                                subtitle: Text("Usuarios"),
                                minVerticalPadding: 8.0,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}

class MercadoBoton extends StatelessWidget {
  final String title;
  final String route;

  const MercadoBoton({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SafeArea(
            top: false,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 200.0,
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      color: Colors.amber,
                      child: InkWell(
                          splashColor: Colors.greenAccent,
                          onTap: () {
                            Navigator.of(context).pushNamed(route);
                          },
                          child: const Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.shop),
                                title: Text("Articulos disponibles: 10"),
                                subtitle: Text("Mercado"),
                                minVerticalPadding: 8.0,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}

class PostBoton extends StatelessWidget {
  final String title;
  final String route;

  const PostBoton({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SafeArea(
            top: false,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 200.0,
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      color: Colors.blue,
                      child: InkWell(
                          splashColor: Colors.amberAccent,
                          onTap: () {
                            Navigator.of(context).pushNamed(route);
                          },
                          child: const Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.message),
                                title: Text("Cantidad Post: 0"),
                                subtitle: Text("Post"),
                                minVerticalPadding: 8.0,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}

class FinanzasBoton extends StatelessWidget {
  final String title;
  final String route;

  const FinanzasBoton({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SafeArea(
            top: false,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 200.0,
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      color: Colors.green,
                      child: InkWell(
                          splashColor: Colors.greenAccent,
                          onTap: () {
                            Navigator.of(context).pushNamed(route);
                          },
                          child: const Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.monetization_on),
                                title: Text("Pagos"),
                                subtitle: Text("Finanzas"),
                                minVerticalPadding: 8.0,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  final String title;
  final String route;
  final user = FirebaseAuth.instance.currentUser!;

  LoginButton({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SafeArea(
            top: false,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 200.0,
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      color: Colors.purple,
                      child: InkWell(
                          splashColor: Colors.purpleAccent,
                          onTap: () {
                            Navigator.of(context).pushNamed(route);
                          },
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.person),
                                title: Text("Usuario conectado:" + user.email!),
                                subtitle: const Text("Login"),
                                minVerticalPadding: 8.0,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
