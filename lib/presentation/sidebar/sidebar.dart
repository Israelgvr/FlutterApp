
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../sidebar/menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = StreamController<bool>.broadcast();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data! ? 0 : -screenWidth,//screenWidth para que se esconda junto con el menu
          right: isSideBarOpenedAsync.data! ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(  
                child: Container(
                  height: MediaQuery.of(context).size.height, // Asegura que el sidebar ocupe toda la pantalla
                  color: const Color(0xFD242531),
                  //datos user cabecera
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(20)),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20), // Espacio superior e inferior
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [  
                            CircleAvatar(
                              radius: 35, // Radio del avatar espacio ocupa
                              //backgroundColor: Colors.white,
                              child: Icon(
                                Icons.perm_identity,
                                size: 50,//tamaño icon
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10,),
                            //widget para los datos usuario
                            Text(
                              "Helena Chung",
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 28, 
                                fontWeight: FontWeight.w800, 
                              ),
                            ),
                          ],
                        ),
                      ),

                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),//color de la linea divisor
                        indent: 32,//margen izquierdo
                        endIndent: 32,//margen derecho
                      ),

                      //menu de opciones
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, top: 10), // Margen izquierdo y superior
                              child: Text(
                                "Menú",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            // Lista de opciones del menú
                            Padding(
                              padding: EdgeInsets.only(left: 15), // Margen izquierdo para todas las opciones
                              child: Column(
                                children: [
                                  MenuItem(
                                    icon: Icons.home,
                                    title: "Principal",
                                    onTap: () {
                                      onIconPressed();
                                      BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                                    },
                                  ),
                                  MenuItem(
                                    icon: Icons.person,
                                    title: "Perfil",
                                    onTap: () {
                                      onIconPressed();
                                      BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
                                    },
                                  ),
                                  MenuItem(
                                    icon: Icons.history,
                                    title: "Historial",
                                    onTap: () {
                                      onIconPressed();
                                      BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyOrdersClickedEvent);
                                    },
                                  ),
                                  MenuItem(
                                    icon: Icons.directions_run,
                                    title: "Nivel de Actividad",
                                    onTap: () {
                                      onIconPressed();
                                      
                                    },
                                  ),
                                  MenuItem(
                                    icon: Icons.notifications,
                                    title: "Notificaciones",
                                    onTap: () {
                                      onIconPressed();
                                      
                                    },
                                  ),
                                  MenuItem(
                                    icon: Icons.health_and_safety,
                                    title: "Diagnostico",
                                    onTap: () {
                                      onIconPressed();
                                      
                                    },
                                  ),
                                  MenuItem(
                                    icon: Icons.settings_outlined,
                                    title: "Plan Personalizado",
                                    onTap: () {
                                      onIconPressed();
                                      
                                    },
                                  ),
                                  MenuItem(
                                    icon: Icons.recommend_outlined,
                                    title: "Recomendaciones",
                                    onTap: () {
                                      onIconPressed();
                                      
                                    },
                                  ),

                                  Divider(
                                    height: 30,
                                    thickness: 0.5,
                                    color: Colors.white.withOpacity(0.3),
                                    indent: 15,
                                    endIndent: 15,
                                  ),
                                  
                                  MenuItem(
                                    icon: Icons.exit_to_app,
                                    title: "Logout",
                                    onTap: () {
                                      onIconPressed();
                                      BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyOrdersClickedEvent);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),//posicion del icon x
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  //boton de cerrar y abrir dashbor
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xFD242531),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
