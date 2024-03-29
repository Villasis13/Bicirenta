import 'package:app_bicirrenta/Administrador/Empresa/Registro_Empresa.dart';
import 'package:app_bicirrenta/Administrador/MenuAdmin.dart';
import 'package:app_bicirrenta/presentation/registro_usuario/registro_Usuario.dart';
import 'package:app_bicirrenta/presentation/login/login_screen.dart';
import 'package:app_bicirrenta/presentation/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../../Administrador/Bicicletas/Registro_Bicicletas.dart';
import '../../Cliente/Cliente.dart';
import '../../Cliente/Confirmar_Alquiler.dart';

final appRoutes = [
  GetPage(name: "/login", page: () => Loginscreen()),
  GetPage(name: "/splash", page: () => SplashScreen()),
  GetPage(name: "/menuAdmin", page: () => PrincipalAdmin()),
  GetPage(name: "/registrarCliente", page: () => Registro_Usuario()),
  GetPage(name: "/registrarNegocio", page: () => RegistroEmpresa()),
  GetPage(name: "/inicioCliente", page: () => MenuCliente()),
  GetPage(name: "/confirmAlquiler", page: () => ConfirmarAlquiler()),
  GetPage(name: "/saveBicy", page: () => Bicicletas()),
];
