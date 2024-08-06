import 'package:app_bicirrenta/Cliente/Cliente.dart';
import 'package:app_bicirrenta/presentation/logout/logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../infrastructure/models/user_model.dart';

class DatosCliente extends StatefulWidget {
  const DatosCliente({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ClienteState();
}

class ClienteState extends State<DatosCliente> {
  int _selectedIndex = 1;
  final UserModel userSession =
      UserModel.fromJson(GetStorage().read('user') ?? {});

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
      
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       const SizedBox(height: 20),
      //       Center(
      //         child: UserAccountsDrawerHeader(
      //           accountName: Text(
      //             '${userSession.personaNombre ?? ''} ${userSession.personaApellidoPaterno ?? ''}',
      //             style: TextStyle(
      //               fontSize: 18,
      //               color: Colors.black,
      //             ),
      //             textAlign: TextAlign.center, // Alinea el texto al centro
      //           ),
      //           currentAccountPicture: CircleAvatar(
      //             backgroundImage: AssetImage("assets/images/avatar7.png"),
      //           ),
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //           ),
      //           accountEmail: null,
      //         ),
      //       ),

      //       ElevatedButton.icon(
      //         onPressed: () async {
      //           await showDialog<bool>(
      //             context: context,
      //             builder: (BuildContext context) {
      //               return AlertDialog(
      //                 title: Text(
      //                   'BICIRENTA',
      //                   textAlign: TextAlign.center,
      //                   style: TextStyle(
      //                     color: Color.fromRGBO(10, 158, 136, 1),
      //                   ),
      //                 ),
      //                 content: Text('¿Estás seguro de cerrar sesión?'),
      //                 actions: [
      //                   TextButton(
      //                     onPressed: () {
      //                       Navigator.pop(context);
      //                     },
      //                     style: TextButton.styleFrom(
      //                       foregroundColor: Color.fromRGBO(78, 193, 176, 1.0),
      //                     ),
      //                     child: Text(
      //                       'No',
      //                       style: TextStyle(fontSize: 17),
      //                     ),
      //                   ),
      //                   TextButton(
      //                     onPressed: () {
      //                       LogOutController controller =
      //                           Get.put(LogOutController());
      //                       controller.logout();
      //                     },
      //                     style: TextButton.styleFrom(
      //                       foregroundColor: Color.fromRGBO(78, 193, 176, 1.0),
      //                     ),
      //                     child: Text(
      //                       'Si',
      //                       style: TextStyle(fontSize: 17),
      //                     ),
      //                   ),
      //                 ],
      //               );
      //             },
      //           );
      //         },
      //         icon: Icon(Icons.exit_to_app, color: Colors.white, size: 30),
      //         label: Text('Cerrar Sesión',
      //             style: TextStyle(color: Colors.white, fontSize: 20)),
      //         style: ElevatedButton.styleFrom(
      //             minimumSize: const Size(300, 40),
      //             backgroundColor: const Color(0xFF35AF86),
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10))),
      //       ),
      //       const SizedBox(height: 20),
      //     ],
      //   ),
      // ),

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
                border: Border.all(
                  color: Color.fromARGB(255, 12, 232, 166),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, 5)
                  )
                ]
              ),

              child: Column(
                children: [
                  SizedBox(height: 10),
                  //Text Nombre Completo
                  Container(
                    child: Form(
                      child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(159, 128, 135, 137),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/avatar7.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      margin: const EdgeInsets.symmetric(horizontal: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 1,
                                          )
                                        ]
                                      ),
                                      child: Form(
                                        child: Container(
                                          child: Center(
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 10),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos horizontalmente
                                                    children: [
                                                      // Text('Roger',
                                                      //   style: TextStyle(
                                                      //     fontSize: 18,
                                                      //     fontWeight: FontWeight.bold
                                                      //   )
                                                      // ),

                                                      SizedBox(width: 5), 
                                                      
                                                      Text(
                                                        '${userSession.personaNombre ?? ''} ${userSession.personaApellidoPaterno ?? ''}',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,)
                                                        // style: TextStyle(
                                                        //   fontSize: 18,
                                                        //   fontWeight: FontWeight.bold
                                                        //   // fontWeight: FontWeight.bold, color: Color( 0xFF34B086),
                                                        // ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        padding: const EdgeInsets.all(15),
                                                        margin: const EdgeInsets.symmetric(horizontal: 2),
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(10),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Colors.white,
                                                              blurRadius: 1,
                                                            )
                                                          ]
                                                        ),
                                                        child: Form(
                                                          child: Container(
                                                            child: Center(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos horizontalmente
                                                                      children: [
                                                                        // Text('00000000',
                                                                        //   style: TextStyle(
                                                                        //     fontSize: 18,
                                                                        //     fontWeight: FontWeight.bold
                                                                        //   )
                                                                        // ),

                                                                        // SizedBox(width: 5), 
                                                                        
                                                                        Text(' ',
                                                                          // controller.bicy
                                                                          //         .typeBicy ??
                                                                          //     '',
                                                                          style: TextStyle(
                                                                            fontSize: 18,
                                                                            fontWeight: FontWeight.bold
                                                                            // fontWeight: FontWeight.bold, color: Color( 0xFF34B086),
                                                                          ),
                                                                        ),
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

                                                // SizedBox(height: 10),
                                                
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                
                                  // const SizedBox(height: 5),

                                  //Boton Cancelar o Regresar al Inicio_Sesion
                                ],
                              ),
                              
                              SizedBox(height: 30,),

                              ElevatedButton.icon(
                                onPressed: () async {
                                  await showDialog<bool>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'BICIRENTA',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color.fromRGBO(12, 13, 13, 1), 
                                          ),
                                        ),
                                        content: Text('¿Estás seguro que deseas cerrar sesión?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: TextButton.styleFrom(
                                              foregroundColor: Color.fromRGBO(
                                                  78, 193, 176, 1.0), 
                                            ),
                                            child: Text('No', style: TextStyle(fontSize: 17),),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              LogOutController controller =
                                                  Get.put(LogOutController());
                                              controller.logout();
                                            },
                                            style: TextButton.styleFrom(
                                              foregroundColor: Color.fromRGBO(
                                                  78, 193, 176, 1.0),
                                            ),
                                            child: Text('Si',style: TextStyle(fontSize: 17),),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.exit_to_app, color: Colors.white, size: 30),
                                label: Text('Cerrar Sesión', style: TextStyle(color: Colors.white, fontSize: 20)), 
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(300, 40),
                                  backgroundColor: const Color(0xFF35AF86),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  )
                                ),
                              ),





                              const SizedBox(height: 10),
                            ]
                          ),
                        ),
                      ),
                    ),
                  )
                ]
              ),
            ),

            //fuera
            SizedBox(height: 20),
            //Text('Roger chavez', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                  MaterialPageRoute(builder: (context) => MenuCliente()),
                  (route) => false,
                );
              } else if (_selectedIndex == 1) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DatosCliente()),
                  (route) => false,
                );
              }
            });
          },
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          selectedIconTheme: IconThemeData(size: 40),
          unselectedIconTheme: IconThemeData(size: 40),
        ),
      ),
    );
  }
}
