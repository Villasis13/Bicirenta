import 'package:app_bicirrenta/Administrador/Empresa/Registro_Empresa.dart';
import 'package:app_bicirrenta/Administrador/MenuAdmin.dart';
import 'package:app_bicirrenta/presentation/registro_usuario/registro_Usuario.dart';
import 'package:app_bicirrenta/presentation/login/login_screen.dart';
import 'package:app_bicirrenta/presentation/splash/splash_screen.dart';
import 'package:get/get.dart';

final appRoutes = [
  GetPage(name: "/login"         , page: ()  => Loginscreen() ),
  GetPage(name: "/splash"   , page: ()  =>SplashScreen()),
  GetPage(name: "/menuAdmin"   , page: ()  =>PrincipalAdmin()),
  GetPage(name: "/registrarCliente"   , page: ()  =>Registro_Usuario()),
  GetPage(name: "/registrarNegocio"   , page: ()  =>Registro_Negocios()),
  
];
