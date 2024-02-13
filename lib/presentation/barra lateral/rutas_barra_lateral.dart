// ignore_for_file: unnecessary_new, prefer_const_constructors
import 'package:app_bicirrenta/Administrador/MenuAdmin.dart';
import 'package:app_bicirrenta/Cliente/Cliente.dart';
import 'package:app_bicirrenta/presentation/registro_usuario/registro_Usuario.dart';
import 'package:app_bicirrenta/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';

class InicioSesion extends StatelessWidget {
  const InicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Loginscreen(),
        '/MenuAdmin': (context) => const PrincipalAdmin(),
        '/MenuCliente': (context) => const MenuCliente(),
        '/Registro_Usuario': (context) => Registro_Usuario(),
      },
    );
  }
}
