import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _registerWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Registro exitoso, realizar acciones adicionales si es necesario
    } catch (e) {
      print('Error al registrar usuario: $e');
      // Manejar el error de registro
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Registro de nuevo usuario',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            RegisterForm(
              onRegister: (email, password) =>
                  _registerWithEmailAndPassword(email, password),
            ),
          ],
        ),
      ),
    );
  }
}


class RegisterForm extends StatefulWidget {
  final Function(String email, String password) onRegister;

  const RegisterForm({Key? key, required this.onRegister}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Correo electrónico'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa tu correo electrónico';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor, ingresa tu contraseña';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();
                widget.onRegister(email, password);
              }
            },
            child: Text('Registrarse'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
