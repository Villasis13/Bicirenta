//

import 'package:app_bicirrenta/Cliente/confirm_alquiler_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConfirmarAlquiler extends StatelessWidget {
  final AlquilerController controller = Get.put(AlquilerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          SizedBox(width: ScreenUtil().setWidth(20)),
        ],
        elevation: 0,
        backgroundColor: Color(0xFF4FC1B0),
      ),
      body: Obx(
        () => SingleChildScrollView(
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
                    Container(
                      child: Form(
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.white,
                                                blurRadius: 1,
                                              )
                                            ]),
                                        child: Form(
                                          child: Container(
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 10),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center, // Centra los elementos horizontalmente
                                                      children: [
                                                        Text('Tipo:',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        SizedBox(
                                                            width:
                                                                5), // Espacio entre los textos
                                                        Text(
                                                          controller.bicy
                                                                  .typeBicy ??
                                                              '',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xFF34B086),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  // Container(
                                                  //   alignment:
                                                  //       Alignment.center,
                                                  //   child: Row(
                                                  //     mainAxisAlignment:
                                                  //         MainAxisAlignment
                                                  //             .center, // Centra los elementos horizontalmente
                                                  //     children: [
                                                  //       SizedBox(
                                                  //           width:
                                                  //               5), // Espacio entre el texto y el ícono
                                                  //       Icon(
                                                  //         Icons.location_on,
                                                  //         size: 30,
                                                  //         color: Color(
                                                  //             0xFF34B086),
                                                  //       ),
                                                  //       Text(
                                                  //           'Calle aguas verdes #123',
                                                  //           style: TextStyle(
                                                  //               fontSize: 13,
                                                  //               fontWeight:
                                                  //                   FontWeight
                                                  //                       .bold)),
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(159, 128, 135, 137),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/Bici_1.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 35),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.white,
                                                blurRadius: 1,
                                              )
                                            ]),
                                        child: Form(
                                          child: Container(
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 10),
                                                  Text(
                                                      controller
                                                              .bicy.infoBicy ??
                                                          '',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.white,
                                                blurRadius: 1,
                                              )
                                            ]),
                                        child: Form(
                                          child: Container(
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 10),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center, // Centra los elementos horizontalmente
                                                      children: [
                                                        Text('HORA',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        SizedBox(
                                                            width:
                                                                5), // Espacio entre los textos
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          controller
                                                              .removeItem();
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                            minimumSize:
                                                                const Size(
                                                                    40, 30),
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFF35AF86),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10))),
                                                        child: Icon(
                                                            Icons.remove,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            size: 20),
                                                      ),
                                                      Text(
                                                          controller
                                                              .counter.value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          controller.addItem();
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                            minimumSize:
                                                                const Size(
                                                                    40, 30),
                                                            backgroundColor:
                                                                const Color(
                                                                    0xFF35AF86),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10))),
                                                        child: Icon(Icons.add,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255),
                                                            size: 20),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center, // Centra los elementos horizontalmente
                                                      children: [
                                                        SizedBox(width: 5),
                                                        Text(
                                                            'TOTAL: S/. ${controller.price.value.toString()}',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //Boton Guardar Registro
                                ElevatedButton(
                                  onPressed: () {
                                    controller.solicitar(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(300, 40),
                                      backgroundColor: const Color(0xFF35AF86),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: const Text('SOLICITAR',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 20)),
                                ),

                                const SizedBox(height: 10),

                                //Boton Cancelar o Regresar al Inicio_Sesion
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ])),

              //fuera
              SizedBox(height: 20),
              //Text('Roger chavez', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
