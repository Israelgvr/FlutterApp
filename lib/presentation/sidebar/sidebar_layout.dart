import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'sidebar.dart';
import '../pages/perfiluser.dart';
import '../pages/historyuser.dart';
import '../pages/home_page.dart';


class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),// Aquí creamos NavigationBloc
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                print("Estado actual: $navigationState"); // Verificar si el estado está cambiando correctamente
                // Aquí estamos extrayendo el widget directamente desde el estado
                if (navigationState is HomePageState) {
                  return HomePage(); // Aquí devolvemos el widget HomePage
                }
                if (navigationState is MyAccountsPageState) {
                  return MyAccountsPage(); // Aquí devolvemos el widget MyAccountsPage
                }
                if (navigationState is MyOrdersPageState) {
                  return MyOrdersPage(); // Aquí devolvemos el widget MyOrdersPage
                }
                return Container(); // Un widget por defecto si no es un Widget
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}