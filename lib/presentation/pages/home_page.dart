import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class HomePage extends StatelessWidget implements NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Pagina Principal",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}