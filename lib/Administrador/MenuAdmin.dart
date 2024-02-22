import 'package:app_bicirrenta/infrastructure/models/inicio_admin_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../presentation/barra lateral/BarraLateral.dart';
import 'admin_controller.dart';

class PrincipalAdmin extends StatelessWidget {
  final AdminController controller = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
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
          IconButton(
            icon: const Icon(Icons.notifications,
                color: Colors.white), // Ajusta el color aquí
            onPressed: () {
              // Fta programar aquí
            },
          )
          //SizedBox(width: ScreenUtil().setWidth(20)),
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
                //este se ba a borrar
                //height: 700,
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
                    ]),

                //hasta aqui

                child: FutureBuilder(
                  future: controller.getDataInicio(),
                  builder: (context, AsyncSnapshot<InicioAdminModel> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Alinear a la izquierda
                        children: [
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 211, 220, 227),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 153, 154, 154),
                                          blurRadius: 1,
                                        )
                                      ]),
                                  child: Form(
                                    child: Container(
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.attach_money,
                                                size: 60,
                                                color: Colors
                                                    .blue), // Icono de dinero
                                            SizedBox(
                                                height:
                                                    10), // Ajusta el espacio entre el icono y el texto
                                            Text('Ganancias del dia',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 20),
                                            Text(
                                                'S/. ${snapshot.data?.gDiaria ?? ''}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 211, 220, 227),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 153, 154, 154),
                                          blurRadius: 1,
                                        )
                                      ]),
                                  child: Form(
                                    child: Container(
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.attach_money,
                                                size: 60,
                                                color: Colors
                                                    .blue), // Icono de dinero
                                            SizedBox(
                                                height:
                                                    10), // Ajusta el espacio entre el icono y el texto
                                            Text('Total gananacias del mes',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 20),
                                            Text(
                                                'S/. ${snapshot.data?.gMensual ?? ''}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

                          SizedBox(height: 17),
                          // Container para el cuadrado
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
