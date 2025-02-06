import 'package:flutter_bloc/flutter_bloc.dart';

// Definimos los eventos de navegación
enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersClickedEvent,
}

// Clase base para los estados de navegación
abstract class NavigationStates {}

class HomePageState extends NavigationStates {}
class MyAccountsPageState extends NavigationStates {}
class MyOrdersPageState extends NavigationStates {}

// El constructor de NavigationBloc debe registrar los eventos correctamente
class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(HomePageState()) {
    // REGISTRAMOS LOS MANEJADORES DE EVENTOS
    on<NavigationEvents>((event, emit) {
      print("Evento recibido: $event");
      switch (event) {
        case NavigationEvents.HomePageClickedEvent:
          emit(HomePageState());
          break;
        case NavigationEvents.MyAccountClickedEvent:
          emit(MyAccountsPageState());
          break;
        case NavigationEvents.MyOrdersClickedEvent:
          emit(MyOrdersPageState());
          break;
      }
    });
  }
}
