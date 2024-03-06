import 'package:app_bicirrenta/Cliente/business_screen.dart';
import 'package:app_bicirrenta/Cliente/clientes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Datos_clientes.dart';

class MenuCliente extends StatefulWidget {
  const MenuCliente({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ClienteState();
}

class ClienteState extends State<MenuCliente> {
  int _selectedIndex = 0;

  final ClientesController controllerBusiness = Get.put(ClientesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            // onTap: () async {
            //   await showDialog<bool>(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         title: Text('BICI RENTA'),
            //         content: Text('¿Estás seguro que deseas cerrar sesión?'),
            //         actions: [
            //           TextButton(
            //             onPressed: () {
            //               Navigator.pop(context);
            //             },
            //             style: TextButton.styleFrom(
            //               foregroundColor: Color.fromRGBO(
            //                   78, 193, 176, 1.0), // Color del texto
            //             ),
            //             child: Text('No'),
            //           ),
            //           TextButton(
            //             onPressed: () {
            //               LogOutController controller =
            //                   Get.put(LogOutController());
            //               controller.logout();
            //             },
            //             style: TextButton.styleFrom(
            //               foregroundColor: Color.fromRGBO(
            //                   78, 193, 176, 1.0), // Color del texto
            //             ),
            //             child: Text('Si'),
            //           ),
            //         ],
            //       );
            //     },
            //   );
            // },
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/Logo_nombre.jpg',
                  height: 30,
                ),
              ),
            ),
          ),
          SizedBox(width: ScreenUtil().setWidth(20)),
        ],
        elevation: 0,
        backgroundColor: Color(0xFF4FC1B0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width - 30,
              child: TextField(
                controller: controllerBusiness.searchController,
                onChanged: (value) {
                  controllerBusiness.searchBuisiness();
                },
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  hintStyle: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 125, 125, 133)),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Icon(Icons.search,
                      size: 24, color: Color.fromARGB(255, 125, 125, 133)),
                ),
                style: TextStyle(fontSize: 18, color: Color(0xFF000000)),
              ),
            ),
            SizedBox(height: 20),
            BusinessScreen(
              controllerBusiness: controllerBusiness,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),


      //tap del botón de abajo

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.green),
          ),
        ),
        child: BottomNavigationBar(
          selectedFontSize: 4,
          backgroundColor: Color.fromARGB(255, 252, 255, 252),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp, color: _selectedIndex == 0 ? Color(0xFF34B086) : Color.fromARGB(255, 125, 125, 133), size: 50),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: _selectedIndex == 1 ? Color(0xFF34B086) : Color.fromARGB(255, 125, 125, 133), size: 50),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF34B086),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.white,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              if (_selectedIndex == 0) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MenuCliente()),
                  (route) => false,
                );
              } else if (_selectedIndex == 1) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DatosCliente()),
                  (route) => false,
                );
              }
            });
          },
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          selectedIconTheme: IconThemeData(size: 40),
          unselectedIconTheme: IconThemeData(size: 40),
        ),
      ),

    );
  }
}