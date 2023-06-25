import 'package:flutter/material.dart';

class CuadradoConImagen extends StatelessWidget {
  final String pathimagen;
  final Function() onTap;

  const CuadradoConImagen(
      {super.key, required this.pathimagen, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey),
        child: Image.asset(
          pathimagen,
          height: 40,
        ),
      ),
    );
  }
}
