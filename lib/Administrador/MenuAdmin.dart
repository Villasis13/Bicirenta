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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/Logo_nombre.jpg',
                height: 30,
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 12, 232, 166).withOpacity(0.5),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: FutureBuilder(
                future: controller.getDataInicio(),
                builder: (context, AsyncSnapshot<InicioAdminModel> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Center(
                          // Centra el primer card
                          child: Container(
                            width: MediaQuery.of(context).size.width *
                                0.8, // Ancho fijo para el card
                            child: _buildInfoCard(
                              context,
                              icon: Icons.attach_money,
                              title: 'Ganancias del día',
                              value: 'S/. ${snapshot.data?.gDiaria ?? 0}',
                              cardColor: Color(
                                  0xFFE3F2FD), // Cambia el color de la tarjeta aquí
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          // Centra el segundo card
                          child: Container(
                            width: MediaQuery.of(context).size.width *
                                0.8, // Ancho fijo para el card
                            child: _buildInfoCard(
                              context,
                              icon: Icons.attach_money,
                              title: 'Total ganancias del mes',
                              value: 'S/. ${snapshot.data?.gMensual ?? 0}',
                              cardColor: Color(
                                  0xFFE3F2FD), // Cambia el color de la tarjeta aquí
                            ),
                          ),
                        ),
                        SizedBox(height: 17),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String value,
      required Color cardColor}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: cardColor, // Usa el color pasado como parámetro
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 153, 154, 154),
            blurRadius: 1,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: Colors.blue),
          SizedBox(height: 10),
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
