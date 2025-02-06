import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/1.jpeg',
      'assets/2.jpeg',
      'assets/3.jpeg',
      'assets/4.jpg',
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Fondo de gradiente lineal
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0B111A), // Blanco
                  Color(0xFF000C3B), // Azul oscuro
                  Color(0xFF0F1657), // Azul aún más oscuro
                  Color(0xFF000000), // Negro
                ],
                stops: [0.0, 0.4, 0.6, 1.0], // Ajusta los puntos de transición
              ),
            ),
          ),
          // Carrusel de imágenes centrado
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.6, // Ajusta el tamaño de la imagen
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 1.0, // Para que las imágenes cubran el 100% del ancho
              ),
              items: images.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover, // Ajuste automático de la imagen
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          // Texto de bienvenida sobre el carrusel
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15, // Ajusta la posición del texto
            left: 40,
            right: 40,
            child: Column(
              children: [
                const Text(
                  '¡Bienvenido!',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 5),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Desliza para explorar',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          // Botón de continuar en la parte inferior
          Positioned(
            bottom: 40, // Ajusta la posición del botón
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
                border: Border.all(
                color: const Color.fromARGB(255, 149, 176, 249),
              ),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF103271),
                    Color(0xFFE4E7EA),
                  ], //color degradado
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                )
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor:  const Color.fromARGB(0, 228, 17, 17), // Color de fondo transparente para ver el degrado
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Redondeado como el contenedor
                    
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Texto en negrita
                  ),
                ),
                child: const Text(
                  'Continuar',
                  style: TextStyle(
                    color: Colors.white, // Texto blanco
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
