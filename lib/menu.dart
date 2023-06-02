import 'package:flutter/material.dart';
import 'routes.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

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
            tooltip: "localization.starterAppTooltipFavorite",
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {},
          ),
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
                const PopupMenuItem(
                  child: Text("localization.demoNavigationRailFirst"),
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
            children: const [
              AgendaBoton(title: 'data 1', route: Routes.agenda),
              Row(
                children: [
                  Expanded(
                      child: ContactoBoton(
                          title: 'data 1', route: Routes.usuario)),
                  Expanded(
                      child:
                          MercadoBoton(title: 'data 1', route: Routes.mercado)),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: PostBoton(title: 'data 1', route: Routes.post)),
                  Expanded(
                      child: FinanzasBoton(
                          title: 'data 1', route: Routes.finanzas)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AgendaBoton extends StatelessWidget {
  final String title;
  final String route;

  const AgendaBoton({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //ElevatedButton(
        //    onPressed: () {
        //      Navigator.of(context).pushNamed(route);
        //    },
        //    child: Padding(
        //      padding: const EdgeInsets.all(8),
        //      child: Text(title),
        //    )),

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
