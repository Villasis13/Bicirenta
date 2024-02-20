//
import 'package:app_bicirrenta/presentation/barra%20lateral/BarraLateral.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../MenuAdmin.dart';

class ListadoBicicletas extends StatefulWidget {
  const ListadoBicicletas({super.key});

  @override
  State<ListadoBicicletas> createState() => _Listado_BicicletasState();
}

class _Listado_BicicletasState extends State<ListadoBicicletas> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(4)),
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
    );
  }
}
