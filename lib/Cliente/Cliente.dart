import 'dart:io';
import 'package:app_bicirrenta/Cliente/Confirmar_Alquiler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../presentation/logout/logout.dart';

File? _image;

class MenuCliente extends StatefulWidget {
  const MenuCliente({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ClienteState();
}

class ClienteState extends State<MenuCliente> {
  int _selectedIndex = 0;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async {
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
            },
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
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 30,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 125, 125, 133)),
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
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 12, 232, 166),
                      blurRadius: 1,
                    )
                  ],
                ),
                // Tu contenido actual

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Bicicleta de',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(width: 5), // Espacio entre los textos
                        Text(
                          'Multeservicios Chavez',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF34B086),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 30,
                          color: Color(0xFF34B086),
                        ),
                        Text('Calle aguas verdes #123',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: ScreenUtil().setWidth(160),
                          height: ScreenUtil().setHeight(200),
                          child: Stack(children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(50),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                //crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('BMX ROJA',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text('S/. 3.00 por hora',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: ScreenUtil().setHeight(10)),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: ScreenUtil().setHeight(120),
                                height: ScreenUtil().setWidth(120),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(159, 128, 135, 137),
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/Bici_1.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),

                    //este el otro cajas de textos
                    SizedBox(height: 15),

                    // Container para el cuadrado
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
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
                icon: Icon(Icons.home_sharp,
                    color: _selectedIndex == 0
                        ? Color(0xFF34B086)
                        : Color.fromARGB(255, 125, 125, 133),
                    size: 50),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,
                    color: _selectedIndex == 1
                        ? Color(0xFF34B086)
                        : Color.fromARGB(255, 125, 125, 133),
                    size: 50),
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
              });
            },
            type: BottomNavigationBarType.fixed,
            elevation: 10,
            selectedIconTheme: IconThemeData(size: 40),
            unselectedIconTheme: IconThemeData(size: 40),
          ),
        ),
      ),
    );
  }
}
