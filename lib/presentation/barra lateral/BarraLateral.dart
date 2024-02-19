import 'package:app_bicirrenta/Administrador/Bicicletas/Listado_Bicicletas.dart';
import 'package:app_bicirrenta/Administrador/Empresa/Listado_Empresa.dart';
import 'package:app_bicirrenta/Administrador/Sulicitudes/Solicitudes_Bicicletas.dart';
import 'package:app_bicirrenta/presentation/logout/logout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarraLateral extends StatelessWidget {
  final VoidCallback onLogout;
  const BarraLateral({Key? key, required this.onLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        Container(
          child: UserAccountsDrawerHeader(
            accountName: Text(
              'Roger Chavez Medina',
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: Text('rogerchavez10@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: Image.asset('assets/images/avatar7.png').image,
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(72, 192, 180, 1.0),
            ),
          ),
        ),

        ListTile(
          leading: Icon(
            Icons.business,
            color: Color.fromRGBO(78, 193, 176, 1.0), // Color del icono
          ),
          title: Text(
            'Mi Negocio',
            style: TextStyle(
                color: Color.fromRGBO(78, 193, 176, 1.0),
                fontSize: 22 // Color del texto
                ),
          ),
          onTap: () async {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ListadoNegocios()),
              (route) => false,
            );
          },
        ),

        //Divider(),
        ListTile(
          leading: Icon(
            Icons.directions_bike,
            color: Color.fromRGBO(78, 193, 176, 1.0), // Color del icono
          ),
          title: Text(
            'Mis Bicicletas',
            style: TextStyle(
                color: Color.fromRGBO(78, 193, 176, 1.0),
                fontSize: 22 // Color del texto
                ),
          ),
          onTap: () async {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ListadoBicicletas()),
              (route) => false,
            );
          },
        ),

        ListTile(
          leading: Icon(
            Icons.track_changes,
            color: Color.fromRGBO(78, 193, 176, 1.0), // Color del icono
          ),
          title: Text(
            'Tráfico',
            style: TextStyle(
                color: Color.fromRGBO(78, 193, 176, 1.0),
                fontSize: 22 // Color del texto
                ),
          ),
          onTap: () async {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Solicitudes()),
              (route) => false,
            );
          },
        ),

        ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Color.fromRGBO(78, 193, 176, 1.0),
            ),
            title: Text(
              'Cerrar Sesión',
              style: TextStyle(
                  color: Color.fromRGBO(78, 193, 176, 1.0), fontSize: 22),
            ),
            onTap: () async {
              // Mostrar un cuadro de diálogo personalizado para confirmar la salida
              await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('BICI RENTA'),
                    content: Text('¿Estás seguro que deseas cerrar sesión?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Color.fromRGBO(
                              78, 193, 176, 1.0), // Color del texto
                        ),
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          LogOutController controller =
                              Get.put(LogOutController());
                          controller.logout();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Color.fromRGBO(
                              78, 193, 176, 1.0), // Color del texto
                        ),
                        child: Text('Si'),
                      ),
                    ],
                  );
                },
              );
            })
      ]),
    );
  }
}
