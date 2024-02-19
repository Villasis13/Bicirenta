//
import 'package:app_bicirrenta/infrastructure/models/tipe_bicy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'admin_bicy_controller.dart';

class Bicicletas extends StatelessWidget {
  final AdminBicyController controller = Get.put(AdminBicyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registro",
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
                //la altura
                //height: 450,
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
                      //Text Nombre Completo
                      // TextField(
                      //   controller: controller.nameBicyController,
                      //   decoration: InputDecoration(
                      //     //label: Text('Nombre Completo'),
                      //     labelText: 'Nombre Bicicleta',
                      //     hintText: 'Ingrese el nombre',
                      //     icon: Icon(
                      //       Icons.directions_bike,
                      //       size: 40,
                      //     ),
                      //     hintStyle: TextStyle(
                      //         color: Color.fromARGB(164, 3, 3, 4)),
                      //   ),
                      //   maxLines: 1,
                      //   textCapitalization:
                      //       TextCapitalization.words,
                      //   obscureText: false,
                      //   textDirection: TextDirection.ltr,
                      //   autocorrect: true,
                      //   enableSuggestions: true,
                      // ),

                      // const SizedBox(height: 10),

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
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.hasData) {
                              if (snapshot.data!.isEmpty) {
                                return Text('Sin datos para Tipo Bicicleta');
                              }

                              return Container(
                                padding: EdgeInsets.only(
                                    left:
                                        50), // Ajusta el margen izquierdo según tus necesidades
                                child: DropdownButtonFormField<TypeBicyModel>(
                                  items: snapshot.data!
                                      .map(
                                        (e) => DropdownMenuItem<TypeBicyModel>(
                                          value: e,
                                          child: Text(e.nameTypeBicy!),
                                        ),
                                      )
                                      .toList(),
                                  value: controller.typeSelected.value,
                                  onChanged: (val) {
                                    controller.typeSelected.value = val!;
                                  },
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.hasError) {
                              return Text('Error al cargar Datos');
                            } else {
                              return SizedBox();
                            }
                          }),

                      //ComboBox
                      //const SizedBox(height: 20),

                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: Row(
                      //     children: [
                      //       Icon(Icons.image,
                      //           size: 40,
                      //           color:
                      //               Color.fromARGB(164, 3, 3, 4)),
                      //       SizedBox(width: 10),
                      //       ElevatedButton(
                      //         onPressed: () {},
                      //         style: ElevatedButton.styleFrom(
                      //             minimumSize: const Size(200, 40),
                      //             backgroundColor: Color.fromARGB(
                      //                 255, 12, 232, 166),
                      //             shape: RoundedRectangleBorder(
                      //                 borderRadius:
                      //                     BorderRadius.circular(
                      //                         10))),
                      //         child: Text('Selecciona una imagen',
                      //             style: TextStyle(
                      //                 color: Color.fromARGB(
                      //                     255, 255, 255, 255),
                      //                 fontSize: 20)),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      // SizedBox(height: 20),

                      // Container(
                      //   width:
                      //       200, // Puedes ajustar el ancho según tus necesidades
                      //   height: 200, // Mantén el mismo alto
                      //   decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     color: Color.fromARGB(160, 24, 140, 176),
                      //   ),
                      //   child: _image == null
                      //       ? Center(child: Text('No hay imagen'))
                      //       : ClipOval(
                      //           child: Image.file(
                      //             _image!,
                      //             fit: BoxFit
                      //                 .cover, // Ajusta la imagen para que cubra completamente el círculo
                      //           ),
                      //         ),
                      // ),

                      // const SizedBox(height: 20),

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

                      //Boton Guardar Registro
                      ElevatedButton(
                        onPressed: () {
                          controller.saveBicy(context);
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 40),
                            backgroundColor: const Color(0xFF35AF86),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Guardar',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20)),
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
