import 'package:flutter/material.dart';

class PersonalizedPlan extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pla Personalizado', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            //para las card
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft, // Alineación a la izquierda
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // Un poco de espacio a los lados
                  child: Text(
                    'Categorías',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              //metodo
              _crearCard1(),
              SizedBox(height: 10,),
              _crearCard2(),
              SizedBox(height: 10,),
              _crearCard3(),
            ],
          ),
        ),
      ),
    );
  }
  
  //metodo para las cards
  Widget _crearCard1() {
    return Card(
      elevation: 5, // Para una sombra de la card
      shadowColor: Colors.white, // Color blanco para la sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Borde redondeado
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), // Borde redondeado del Container
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF2C2B6A)], // Colores del degradado
            begin: Alignment.centerRight, // Inicio del degradado a la derecha
            end: Alignment.centerLeft, // Fin del degradado a la izquierda
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            // Contenedor para el Título
            Expanded(
              flex: 2, // Este ocupará 2/3 del ancho de la card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alinear a la izquierda
                children: <Widget>[
                  Text(
                    'Rutina de Ejercicio',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  
                ],
              ),
            ),
            
            // Contenedor para la Imagen
            Expanded(
              flex: 1, // Este ocupará 1/3 del ancho de la card
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: Image.asset(
                  "assets/logo.png", // Ruta de la imagen local
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _crearCard2() {
    return Card(
      elevation: 5, // Para una sombra de la card
      shadowColor: Colors.white, // Color blanco para la sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Borde redondeado
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), // Borde redondeado del Container
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF2C2B6A)], // Colores del degradado
            begin: Alignment.centerRight, // Inicio del degradado a la derecha
            end: Alignment.centerLeft, // Fin del degradado a la izquierda
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            // Contenedor para el Título
            Expanded(
              flex: 2, // Este ocupará 2/3 del ancho de la card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alinear a la izquierda
                children: <Widget>[
                  Text(
                    'Plan de Alimentación',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  
                ],
              ),
            ),
            
            // Contenedor para la Imagen
            Expanded(
              flex: 1, // Este ocupará 1/3 del ancho de la card
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: Image.asset(
                  "assets/nutrition.png", // Ruta de la imagen local
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _crearCard3() {
    return Card(
      elevation: 5, // Para una sombra de la card
      shadowColor: Colors.white, // Color blanco para la sombra
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Borde redondeado
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), // Borde redondeado del Container
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF2C2B6A)], // Colores del degradado
            begin: Alignment.centerRight, // Inicio del degradado a la derecha
            end: Alignment.centerLeft, // Fin del degradado a la izquierda
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            // Contenedor para el Título
            Expanded(
              flex: 2, // Este ocupará 2/3 del ancho de la card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alinear a la izquierda
                children: <Widget>[
                  Text(
                    'Objetivo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  
                ],
              ),
            ),
            
            // Contenedor para la Imagen
            Expanded(
              flex: 1, // Este ocupará 1/3 del ancho de la card
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: Image.asset(
                  "assets/logo.png", // Ruta de la imagen local
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}