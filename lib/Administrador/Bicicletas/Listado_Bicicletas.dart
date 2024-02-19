//
import 'package:app_bicirrenta/presentation/barra%20lateral/BarraLateral.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../MenuAdmin.dart';

File? _image;

//void main() => runApp(const Usuario());

class ListadoBicicletas extends StatelessWidget {
  const ListadoBicicletas({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Listado_Bicicletas(),
      },
    );
  }
}

class Listado_Bicicletas extends StatefulWidget {
  const Listado_Bicicletas({super.key});

  @override
  State<Listado_Bicicletas> createState() => _Listado_BicicletasState();
}

class _Listado_BicicletasState extends State<Listado_Bicicletas> {
  int _selectedIndex = 0;

  Future<void> Seleccionar_Imagen() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        if (_image != null) {}
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            "Mis Bicicletas",
            style: const TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
          ),
          actions: [
            InkWell(
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
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(4)),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/saveBicy');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/images/mas.jpg',
                    height: 30,
                  ),
                ),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: Color(0xFF4FC1B0),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text('Listado de Bicicletas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Container(
                width: double.infinity,
                //la altura
                height: 550,
                padding: const EdgeInsets.all(20),
                margin:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset(0, 5))
                    ]),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //aqui va a ir el listado de todos el negocio de la empresa

                        SizedBox(height: 35),
                      ],
                    )
                  ],
                ),
              ),
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
                if (_selectedIndex == 0) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PrincipalAdmin()),
                    (route) => false,
                  );
                } else if (_selectedIndex == 1) {
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Registro_Usuario()),
                  //   (route) => false,
                  // );
                }
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
