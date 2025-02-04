import 'package:flutter/material.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';

class MyAccountsPage extends StatelessWidget implements NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "My Perfil Usuario",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}
