import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  
  const MenuItem({
    super.key, // Corregido para permitir valores nulos
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12),// Menos espacio para no hacer botones muy grandes
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,// Azul para contraste
              size: 30,
            ),
            const SizedBox(width: 15),//separacion entre iconos y titulos de opciones
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500, 
                fontSize: 18, 
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
