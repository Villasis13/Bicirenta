//
import 'package:app_bicirrenta/Administrador/Bicicletas/list_bicy_controller.dart';
import 'package:app_bicirrenta/infrastructure/models/bicy_model.dart';
import 'package:app_bicirrenta/presentation/barra%20lateral/BarraLateral.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'admin_bicy_controller.dart';

class ListadoBicicletas extends StatelessWidget {
  final ListBicyController controller = Get.put(ListBicyController());

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
                AdminBicyController t = Get.find<AdminBicyController>();
                t.resetFields(); 
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
      
      body: GetBuilder<ListBicyController>(builder: (_) {
        return RefreshIndicator(
          onRefresh: () => controller.getMyBicys(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text('Listado de Bicicletas',  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  height: ScreenUtil().setHeight(600),
                  padding: const EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(16),
                    vertical: ScreenUtil().setHeight(10),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset(0, 5))
                    ],
                  ),
                  child: FutureBuilder<List<BicyModel>>(
                      future: controller.getMyBicys(),
                      builder: (_, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return Center(
                              child: Text('Aún no se han registrados bicicletas'),
                            );
                          }
                          return Expanded(
                            child: GridView.builder(
                                itemCount: snapshot.data!.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // number of items in each row
                                  mainAxisSpacing: 8.0, // spacing between rows
                                  crossAxisSpacing:  8.0, // spacing between columns
                                  childAspectRatio: .7,
                                ),
                                itemBuilder: (s, index) {
                                  return BicyWidget(bicy: snapshot.data![index]);
                                }),
                          );
                        } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasError) {
                          return Column(
                            children: [
                              const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Text(
                                  'Ocurrió un error',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        );
      }),

         
      
    );
  }
}

class BicyWidget extends StatelessWidget {
  
  BicyWidget({super.key, required this.bicy});
  final BicyModel bicy;
  final AdminBicyController t = Get.put(AdminBicyController());



  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onLongPress: () {
      //   if(bicy.statusBicy != "0"){
      //     bool validar =  t.ModalEstado(context, int.parse(bicy.idBicy.toString()));
      //     if(validar){          
      //       ListadoBicicletas().controller.getMyBicys();
      //     }
      //   } else {
      //     Get.snackbar("Estado", "No se puede Cambiar el estado de la bicicleta, Esta en Uso", colorText: Colors.white, backgroundColor: Colors.red);
      //   }
        
      // },

      onLongPress: () {
        if (bicy.statusBicy != "0" && bicy.statusBicy != "2") {
          bool validar = t.ModalEstado(context, int.parse(bicy.idBicy.toString()));
          if (validar) {
          ListadoBicicletas().controller.getMyBicys();
          }
        }else {
          Get.snackbar("Estado", "No se puede cambiar el estado de la bicicleta, está en uso o solicitado", colorText: Colors.white, backgroundColor: Colors.red);
        }
      },

      onTap: () => {
        //Get.snackbar("eeee", bicy.idBicy.toString()),
        t.Ojo.value = "",
        
        t.selectBicycleForEdit(bicy),
        // t.Ojo.value = bicy.typeBicy.toString(),
        t.Ojo.value = bicy.typeBicy ?? "",
        t.IdBicicletaselect.value = int.parse(bicy.idBicy.toString()),
        // t.nameBicyController.text = bicy.typeBicy.toString(),
        t.nameBicyController.text = bicy.typeBicy ?? "",
        // t.infoBicyController.text = bicy.infoBicy.toString(),
        t.infoBicyController.text = bicy.infoBicy ?? "",
        // t.priceBicyController.text = bicy.priceBicy.toString(),
        t.priceBicyController.text = bicy.priceBicy ?? "",
        Get.toNamed('/saveBicy'),
      },

      child: Container(
        width: ScreenUtil().setWidth(160),
        height: ScreenUtil().setHeight(220),
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(4)),
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(50),
              bottom: ScreenUtil().setHeight(10),
            ),
            // decoration: BoxDecoration(
            //   color: (bicy.statusBicy == '0') ? Color(0XFFFFA0A0) : (bicy.statusBicy == '2') ? Color.fromARGB(255, 84, 180, 24) : Colors.white, 
            //   border: Border.all(color: Colors.grey),
            //   borderRadius: BorderRadius.circular(30),
            //   boxShadow: [
            //     BoxShadow(
            //         color: Colors.black.withOpacity(.3),
            //         offset: Offset(0, 4),
            //         blurRadius: 6,
            //         spreadRadius: 0),
            //   ],
            // ),
            decoration: BoxDecoration(
            color: (bicy.statusBicy == '0') ? Color(0XFFFFA0A0) 
                : (bicy.statusBicy == '3') ? Color.fromRGBO(162, 171, 170, 1)
                : (bicy.statusBicy == '2') ? Color.fromARGB(255, 136, 188, 104)
                    : Color.fromARGB(255, 244, 248, 241),  // Cambia este color al que desees cuando el estado es '2'
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.3),
                offset: Offset(0, 4),
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ],
          ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  bicy.typeBicy ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text('S/. ${bicy.priceBicy ?? ''} por hora',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
                  image: AssetImage("assets/images/Bici_1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(4),
                vertical: ScreenUtil().setHeight(1),
              ),
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(4)),
                  child: Text( bicy.statusBicy == '0' ? "Ocupado" : (bicy.statusBicy == '1' ? "Libre" : ( bicy.statusBicy == '2' ? "Solicitado" : "Inactivo")),
                // (bicy.statusBicy == '0') ? 'Ocupado' : (bicy.statusBicy == '2') ? 'Solicitado' : 'Libre' : (bicy.statusBicy == '3') ? 'Disponible' : 'Inactivo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
