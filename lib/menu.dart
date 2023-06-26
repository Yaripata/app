import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'routes.dart';
import 'botones.dart';

class Menu extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Menu({super.key});

  Future<void> _signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text("Menu de inicio"),
        actions: [
          IconButton(
            tooltip: "localization.starterAppTooltipSearch",
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          PopupMenuButton<Text>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text("Cerrar sesion"),
                  onTap: () {
                    _signOut(context);
                  },
                ),
                const PopupMenuItem(
                  child: Text("localization.demoNavigationRailSecond"),
                ),
                const PopupMenuItem(
                  child: Text("localization.demoNavigationRailThird"),
                ),
              ];
            },
          )
        ],
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: ListView(
            children: [
              const AgendaBoton(title: 'data 1', route: Routes.agenda),
              const Row(
                children: [
                  Expanded(
                      child: ContactoBoton(
                          title: 'data 1', route: Routes.usuario)),
                  Expanded(
                      child:
                          MercadoBoton(title: 'data 1', route: Routes.mercado)),
                ],
              ),
              const Row(
                children: [
                  Expanded(
                      child: PostBoton(title: 'data 1', route: Routes.post)),
                  Expanded(
                      child: FinanzasBoton(
                          title: 'data 1', route: Routes.finanzas)),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: LoginButton(title: 'data1', route: Routes.login))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
