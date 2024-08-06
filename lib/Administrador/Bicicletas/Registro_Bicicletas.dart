//
// ignore_for_file: must_be_immutable

import 'package:app_bicirrenta/infrastructure/models/tipe_bicy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'admin_bicy_controller.dart';

class Bicicletas extends StatefulWidget {
  @override
  State<Bicicletas> createState() => _BicicletasState();
}

class _BicicletasState extends State<Bicicletas> {  
  final AdminBicyController controller = Get.put(AdminBicyController());
  SingingCharacter? _character = SingingCharacter.Activo;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registro de bicicletas",
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
          SizedBox(
            width: ScreenUtil().setWidth(10),
          )
        ],
        elevation: 0,
        backgroundColor: Color(0xFF4FC1B0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset(0, 5))
                    ]),

                child: Column(children: [
                  SizedBox(height: 10),
                  //Text Nombre Completo

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Icon(Icons.check_circle,
                                size: 40, color: Color.fromARGB(164, 3, 3, 4)),
                            SizedBox(width: 10),
                            Text('Seleccione el tipo de bicicleta'),
                          ],
                        ),
                      ),

                      FutureBuilder<List<TypeBicyModel>>(
                          future: controller.getTypes(),
                          builder: (c, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                              if (snapshot.data!.isEmpty) {
                                return Text('Sin datos para Tipo Bicicleta');
                              }
                              return Container(
                                padding: EdgeInsets.only(left: 50), // Ajusta el margen izquierdo según tus necesidades
                                child: DropdownButtonFormField<TypeBicyModel>(
                                  items: snapshot.data!.map(
                                        (e) => DropdownMenuItem<TypeBicyModel>(
                                          value: e,
                                          child: Text(e.nameTypeBicy ?? 'Sin Nombre'),
                                        ),
                                      ).toList(),
                                  value: controller.typeSelected.value,
                                  onChanged: (val) {
                                    controller.typeSelected.value = val!;
                                  },
                                ),
                              );
                            } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasError) {
                              return Text('Error al cargar Datos');
                            } else {
                              return SizedBox();
                            }
                        }),

                      SizedBox(height: 35),

                      //Text Clave Completo
                      TextField(
                        controller: controller.priceBicyController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: 'Precio por hora',
                          hintText: 'Ingrese el precio del alquiler por hora',
                          icon: Icon(
                            Icons.currency_exchange,
                            size: 40,
                          ),
                          hintStyle:
                              TextStyle(color: Color.fromARGB(164, 3, 3, 4)),
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        textDirection: TextDirection.ltr,
                        autocorrect: true,
                        enableSuggestions: true,
                      ),

                      SizedBox(height: 35),

                      //Text Clave Completo
                      TextField(
                        controller: controller.infoBicyController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: 'Descripcion de la bicicleta',
                          hintText: 'Ingrese la descripcion',
                          icon: Icon(
                            Icons.description,
                            size: 40,
                          ),
                          hintStyle:
                              TextStyle(color: Color.fromARGB(164, 3, 3, 4)),
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        textDirection: TextDirection.ltr,
                        autocorrect: true,
                        enableSuggestions: true,
                      ),

                      const SizedBox(height: 30),
                      
                      // RadioListTile<SingingCharacter>(
                      //       title: const Text('Activo'),
                      //       value: SingingCharacter.Activo,
                      //       groupValue: _character,
                      //       onChanged: (SingingCharacter? value) {
                      //         setState(() {
                      //           _character = value;
                      //         });
                      //       },
                      //     ),                    


                      //     RadioListTile<SingingCharacter>(
                      //       title: const Text('Inactivo'),
                      //       value: SingingCharacter.Inactivo,
                      //       groupValue: _character,
                      //       onChanged: (SingingCharacter? value) {
                      //         setState(() {
                      //           _character = value;
                      //         });
                      //       },
                      //     ),
                          
                      //Boton Guardar Registro
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          void showConfirmationDialog(BuildContext context, VoidCallback onConfirmed) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    '¿Estás seguro de ${controller.IdBicicletaselect.value != 0 ? 'actualizar' : 'guardar'} la bicicleta?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("No"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        onConfirmed();
                                      },
                                      child: Text("Sí"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }

                          if (controller.IdBicicletaselect.value != 0) {
                            showConfirmationDialog(context, () {
                              controller.updateBicy(
                                controller.IdBicicletaselect.value,
                                int.parse(controller.typeSelected.value!.idTypeBicy!),
                                controller.infoBicyController.text.trim(),
                                controller.priceBicyController.text.trim(),
                              );
                            });
                          } else {
                            showConfirmationDialog(context, () {
                              controller.saveBicy(context);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 40),
                          backgroundColor: const Color(0xFF35AF86),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Guardar',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                          ),
                        ),
                      ),                     

                      const SizedBox(height: 10),

                      //Boton Cancelar o Regresar al Inicio_Sesion
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 40),
                            backgroundColor: const Color(0xFF4FC1B0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Cancelar',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20)),
                      ),
                    ],
                  )
                ])),

            //fuera
            SizedBox(height: 20),
            //Text('Roger chavez', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
} 



enum SingingCharacter { Activo, Inactivo}
