import 'package:flutter/material.dart';
import 'package:lulu_app/finanzas.dart';
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

  static Route routes(RouteSettings settings) {
    MaterialPageRoute _buildRoute(Widget widget) {
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    }

    switch (settings.name) {
      case menu:
        return _buildRoute(const Menu());
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
      default:
        throw Exception('La ruta no existe');
    }
  }
}
