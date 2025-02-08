import 'package:flutter/material.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';

class MyHistory extends StatefulWidget implements NavigationStates {
  @override
  _MyHistoryState createState() => _MyHistoryState();
}

class _MyHistoryState extends State<MyHistory> {
  //Globalkey se asocia a formularios para acceder y manipular el estado desde cualquier parte del widget
  final _formkey = GlobalKey<FormState>();
  
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String? _nivelActividad;
  String? _objetivo;

  void _submitForm() {

  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height, //para que ocupe todo el alto de la pantall
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 80,),
              Text(
                "HISTORIAL",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20,),

              TextFormField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Ingresar su peso (Kg)",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                  border: OutlineInputBorder(),
                  
                ),
              ),
              SizedBox(height: 20,),

              TextFormField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Ingrese su altura (Cm)",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                  border: OutlineInputBorder(),
                  
                ),

              ),
              SizedBox(height: 20,),
              
              DropdownButtonFormField<String>(
                value: _nivelActividad,
                decoration: InputDecoration(
                  labelText: "Nivel de Actividad",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                  border: OutlineInputBorder(),
                ),
                items: ["Sedentario", "Actividad ligera", "Actividad moderada", "Atleta"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(color: Colors.white, fontSize: 20),)))
                  .toList(),
                onChanged: (value) {
                  setState(() {
                    _nivelActividad = value;
                  });
                },
              ),
              SizedBox(height: 20,),

              DropdownButtonFormField<String>(
                value: _objetivo,
                decoration: InputDecoration(
                  labelText: "Objetivo",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                  border: OutlineInputBorder(),
                ),
                items: ["op1", "op2"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(color: Colors.white, fontSize: 20),)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _objetivo = value;
                  });
                },
              ),
              SizedBox(height: 20,),

              TextFormField(
                
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  labelText: "Resultado IMC",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                  border: OutlineInputBorder(),
                  
                ),

              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  //backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color.fromARGB(245, 241, 17, 17),
                ),
                child: Ink(

                  decoration: BoxDecoration(
                    gradient:const LinearGradient(
                      colors: [Color(0xBA10E3FF),Color(0xFF0CF1F1),],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 400,
                      minHeight: 40,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Enviar", 
                        style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                    )
                  ),
                ),
              ),
            ],
          ), 
        ),
      ),
    );
  }
}