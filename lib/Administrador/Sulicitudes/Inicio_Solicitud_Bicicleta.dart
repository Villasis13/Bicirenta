import 'package:app_bicirrenta/infrastructure/models/solicitudes_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../presentation/barra lateral/BarraLateral.dart';
import 'solicitudes_controller.dart';

class InicioSolicitudBicicleta extends StatelessWidget {
  final SolicitudesController controller = Get.put(SolicitudesController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            "TRÁFICO",
            style: const TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
          ),
          actions: [
            InkWell(
              child: Container(
                margin: EdgeInsets.only(right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/Logo_nombre.jpg',
                    height: 30,
                  ),
                ),
              ),
            ),
          ],
          elevation: 1,
          toolbarHeight: 60,
          backgroundColor: Color(0xFF4FC1B0),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'SOLICITUDES'),
              Tab(text: 'ALQUILADOS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InicioSolicitudes(
              controller: controller,
            ),
            InicioAlquileres(),
          ],
        ),
      ),
    );
  }
}

class InicioSolicitudes extends StatelessWidget {
  InicioSolicitudes({super.key, required this.controller});
  final SolicitudesController controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SolicitudesController>(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              height: ScreenUtil().setHeight(600),
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
              child: FutureBuilder<List<SolicitudesModel>>(
                  future: controller.getSolicitudes(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return Center(
                          child: Text('No existen solicitudes disponibles'),
                        );
                      }
                      return Expanded(
                        child: GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 5.0, // spacing between rows
                              crossAxisSpacing: 1.0, // spacing between columns
                              childAspectRatio: .65,
                            ),
                            itemBuilder: (s, index) {
                              return Container(
                                padding: const EdgeInsets.all(15),
                                margin: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(4),
                                    vertical: ScreenUtil().setHeight(5)),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 211, 220, 227),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data![index].personName ?? '',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: ScreenUtil().setHeight(5)),
                                    Text('Solicita Bicicleta',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400)),
                                    Text(snapshot.data![index].typeName ?? '',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: ScreenUtil().setHeight(5)),
                                    Text(
                                        'Por ${snapshot.data![index].timeSoli ?? ''} Hora(s)',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        controller.changeStatusSoli(
                                            context,
                                            'aceptar',
                                            snapshot.data![index].idSoli!,
                                            '2');
                                      },
                                      child: Container(
                                        width: ScreenUtil().setWidth(100),
                                        height: ScreenUtil().setHeight(30),
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        controller.changeStatusSoli(
                                            context,
                                            'rechazar',
                                            snapshot.data![index].idSoli!,
                                            '0');
                                      },
                                      icon: Icon(
                                        Icons.cancel_rounded,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        snapshot.hasError) {
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

            //fuera
            SizedBox(height: 20),
            //Text('Roger chavez', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      );
    });
  }
}

class InicioAlquileres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            //este se ba a borrar
            //height: 500,
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

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alinear a la izquierda
              children: [
                SizedBox(height: 4),

                Row(
                  children: [
                    Expanded(
                      flex:
                          2, // Ajusta el flex del primer contenedor para ocupar más ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Jorge Tenazoa Dorado',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 10), // Ajusta el espacio entre los contenedores

                    Expanded(
                      flex:
                          1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '01:50:20 AM',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1, // Ajusta según sea necesario
                                    overflow: TextOverflow.ellipsis,
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

                SizedBox(height: 17),

                Row(
                  children: [
                    Expanded(
                      flex:
                          2, // Ajusta el flex del primer contenedor para ocupar más ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Roger Chavez Medina',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 10), // Ajusta el espacio entre los contenedores

                    Expanded(
                      flex:
                          1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '09:50:20 AM',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1, // Ajusta según sea necesario
                                    overflow: TextOverflow.ellipsis,
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

                SizedBox(height: 17),

                Row(
                  children: [
                    Expanded(
                      flex:
                          2, // Ajusta el flex del primer contenedor para ocupar más ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Wagner Villasis Hidalgo',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 10), // Ajusta el espacio entre los contenedores

                    Expanded(
                      flex:
                          1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '07:30:20 PM',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1, // Ajusta según sea necesario
                                    overflow: TextOverflow.ellipsis,
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

                SizedBox(height: 17),

                Row(
                  children: [
                    Expanded(
                      flex:
                          2, // Ajusta el flex del primer contenedor para ocupar más ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Luisa Medina Quispe',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 10), // Ajusta el espacio entre los contenedores

                    Expanded(
                      flex:
                          1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '05:50:20 PM',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1, // Ajusta según sea necesario
                                    overflow: TextOverflow.ellipsis,
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

                SizedBox(height: 17),

                Row(
                  children: [
                    Expanded(
                      flex:
                          2, // Ajusta el flex del primer contenedor para ocupar más ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Victor Medina Vilcatoma',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 10), // Ajusta el espacio entre los contenedores

                    Expanded(
                      flex:
                          1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '11:30:20 AM',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1, // Ajusta según sea necesario
                                    overflow: TextOverflow.ellipsis,
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

                SizedBox(height: 17),

                Row(
                  children: [
                    Expanded(
                      flex:
                          2, // Ajusta el flex del primer contenedor para ocupar más ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Wilmer Chavez Medina',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 10), // Ajusta el espacio entre los contenedores

                    Expanded(
                      flex:
                          1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '10:20:20 AM',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1, // Ajusta según sea necesario
                                    overflow: TextOverflow.ellipsis,
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

                SizedBox(height: 17),

                Row(
                  children: [
                    Expanded(
                      flex:
                          2, // Ajusta el flex del primer contenedor para ocupar más ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Elena Gutierrez',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 10), // Ajusta el espacio entre los contenedores

                    Expanded(
                      flex:
                          1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '05:30:20 PM',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1, // Ajusta según sea necesario
                                    overflow: TextOverflow.ellipsis,
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

                SizedBox(height: 17),

                Row(
                  children: [
                    Expanded(
                      flex:
                          2, // Ajusta el flex del primer contenedor para ocupar más ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Diandra Da Costa',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 10), // Ajusta el espacio entre los contenedores

                    Expanded(
                      flex:
                          1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '03:40:20 PM',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1, // Ajusta según sea necesario
                                    overflow: TextOverflow.ellipsis,
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

                SizedBox(height: 17),

                Row(
                  children: [
                    Expanded(
                      flex:
                          2, // Ajusta el flex del primer contenedor para ocupar más ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Elide Portocarrero',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 10), // Ajusta el espacio entre los contenedores

                    Expanded(
                      flex:
                          1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '03:30:20 AM',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1, // Ajusta según sea necesario
                                    overflow: TextOverflow.ellipsis,
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

                SizedBox(height: 17),

                Row(
                  children: [
                    Expanded(
                      flex:
                          2, // Ajusta el flex del primer contenedor para ocupar más ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Michel Cisneros Llatas',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 10), // Ajusta el espacio entre los contenedores

                    Expanded(
                      flex:
                          1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '02:40:40 PM',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1, // Ajusta según sea necesario
                                    overflow: TextOverflow.ellipsis,
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

                SizedBox(height: 17),

                Row(
                  children: [
                    Expanded(
                      flex:
                          2, // Ajusta el flex del primer contenedor para ocupar más ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Bryan Diaz Vargas',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 10), // Ajusta el espacio entre los contenedores

                    Expanded(
                      flex:
                          1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 153, 154, 154),
                                blurRadius: 1,
                              )
                            ]),
                        child: Form(
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    '02:23:20 PM',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1, // Ajusta según sea necesario
                                    overflow: TextOverflow.ellipsis,
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

                SizedBox(height: 17),
                // Container para el cuadrado
              ],
            ),
          ),

          //fuera
          SizedBox(height: 20),
          //Text('Roger chavez', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
