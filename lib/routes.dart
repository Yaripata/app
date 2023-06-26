import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lulu_app/auth_services/auth.dart';
import 'package:lulu_app/finanzas.dart';
import 'package:lulu_app/auth_services/register.dart';
import 'menu.dart';
import 'usuarios.dart';
import 'agenda.dart';
import 'mercado.dart';
import 'posts.dart';

class Routes {
  static const menu = '/';
  static const agenda = 'agenda';
  static const usuario = 'usuarios';
  static const mercado = 'mercado';
  static const post = 'post';
  static const finanzas = 'finanzas';
  static const login = 'login';
  static const register = 'register';

  static Route routes(RouteSettings settings) {
    MaterialPageRoute _buildRoute(Widget widget) {
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    }

    // Verificar si hay un usuario autenticado
    User? currentUser = FirebaseAuth.instance.currentUser;

    switch (settings.name) {
      case menu:
        if (currentUser != null) {
          // Usuario autenticado, ir al menú principal
          return _buildRoute(Menu());
        } else {
          // Usuario no autenticado, ir a la pantalla de inicio de sesión
          return _buildRoute(Auth());
        }
      case register:
        return _buildRoute(RegisterPage());
      case agenda:
        return _buildRoute(const Agenda());
      case usuario:
        return _buildRoute(const Usuarios());
      case mercado:
        return _buildRoute(const Mercado());
      case post:
        return _buildRoute(const Post());
      case finanzas:
        return _buildRoute(const Finanzas());
      case login:
        return _buildRoute(Auth());
      default:
        throw Exception('La ruta no existe');
    }
  }
  
  
  
}
