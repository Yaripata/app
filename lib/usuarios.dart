import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'routes.dart';

class Usuarios extends StatelessWidget {
  const Usuarios({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: _fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error al cargar los usuarios');
        } else {
          final users = snapshot.data;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text('Usuario: ${user.displayName ?? ''}'),
                subtitle: Text('Correo electrónico: ${user.email ?? ''}'),
                // Aquí puedes mostrar más información del usuario si lo deseas
              );
            },
          );
        }
      },
    );
  }

  Future<List<User>> _fetchUsers() async {
    List<User> users = [];

    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInAnonymously();
      User? currentUser = credential.user;

      if (currentUser != null) {
        users = await FirebaseAuth.instance
            .listUsers()
            .then((result) => result.users);
      }
    } catch (e) {
      print('Error al obtener los usuarios: $e');
    }

    return users;
  }
}
