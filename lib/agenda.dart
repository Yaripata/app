import 'package:flutter/material.dart';
import 'main.dart';
import 'routes.dart';

class Agenda extends StatelessWidget {
  const Agenda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              navigatorkey.currentState
                  ?.pushNamedAndRemoveUntil(Routes.menu, (r) => false);
            }),
        title: const Text("Agenda"),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
