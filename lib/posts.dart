import 'package:flutter/material.dart';
import 'componentes/post.dart';
import 'main.dart';
import 'routes.dart';

class Post extends StatelessWidget {
  const Post({super.key});

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
        title: const Text("Chat"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Scrollbar(
            child: ListView(
          children: const [
            ListTile(
              leading: ExcludeSemantics(
                child: CircleAvatar(child: Text('1')),
              ),
              title: Text("Texto"),
              subtitle: Text("subtitulo"),
            ),
            FacebookPostWidget()
          ],
        )),
      ),
    );
  }
}
