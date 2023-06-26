// ignore_for_file: must_be_immutable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:lulu_app/routes.dart';


class Auth extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return _auth.signInWithCredential(credential);
    } catch (e) {
      print('Error al iniciar sesión con Google: $e');
      return null;
    }
  }

  Future<UserCredential?> _signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final AuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);
        return _auth.signInWithCredential(credential);
      } else {
        print('Error al iniciar sesión con Facebook: ${result.message}');
        return null;
      }
    } catch (e) {
      print('Error al iniciar sesión con Facebook: $e');
      return null;
    }
  }

  Future<UserCredential?> _signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Error al iniciar sesión con correo y contraseña: $e');
      return null;
    }
  }

  Future<void> _navigateToHome(BuildContext context) async {
    User? user = _auth.currentUser;
    if (user != null) {
      Navigator.pushNamedAndRemoveUntil(context, Routes.menu, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await _signInWithGoogle();
                _navigateToHome(context);
              },
              child: Text('Iniciar sesión con Google'),
            ),
            SizedBox(height: 16.0),
            // ElevatedButton(
            //   onPressed: () async {
            //     await _signInWithFacebook();
            //     _navigateToHome(context);
            //   },
            //   child: Text('Iniciar sesión con Facebook'),
            // ),
            SizedBox(height: 16.0),
            Text(
              'O inicia sesión con tu correo y contraseña',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            LoginForm(
              onSignIn:(email, password) async {
                await _signInWithEmailAndPassword(email, password);
                _navigateToHome(context);
              },),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final Function(String, String) onSignIn;

  const LoginForm({required this.onSignIn});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Correo electrónico',
          ),
        ),
        SizedBox(height: 8.0),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Contraseña',
          ),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            final email = _emailController.text;
            final password = _passwordController.text;
            widget.onSignIn(email, password);
          },
          child: Text('Iniciar sesión'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.register);
          },
          child: Text('Registrarse'),
        )
      ],
    );
  }
}