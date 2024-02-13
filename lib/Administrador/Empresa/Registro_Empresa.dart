import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/registro_usuario/signup_controller.dart';

class RegistroEmpresa extends StatelessWidget {
  RegistroEmpresa({super.key});
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'REGISTRO DE NEGOCIOS',
          style: TextStyle(
            color: Color.fromARGB(255, 53, 175, 134),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: new AssetImage("assets/images/london-car.jpg"),
              )),
              width: double.infinity,
              height: size.height * 0.30,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 150),

                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15,
                                offset: Offset(0, 5))
                          ]),
                      child: Column(children: [
                        Text(
                          'Complete el formulario',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),

                        //Text Nombre Completo
                        Container(
                          child: Form(
                            child: Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //Text Negocio
                                    TextField(
                                      controller:
                                          controller.nameBusinessController,
                                      decoration: InputDecoration(
                                        //label: Text('Nombre Completo'),
                                        labelText: 'Negocio',
                                        hintText:
                                            'Ingrese el nombre del Negocio',
                                        icon: Icon(
                                          Icons.business,
                                          size: 40,
                                        ),
                                        hintStyle: TextStyle(
                                            color:
                                                Color.fromARGB(164, 3, 3, 4)),
                                      ),
                                      maxLines: 1,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      textDirection: TextDirection.ltr,
                                      autocorrect: true,
                                      enableSuggestions: true,
                                    ),

                                    TextField(
                                      controller:
                                          controller.addressBusinessController,
                                      decoration: InputDecoration(
                                        //label: Text('Nombre Completo'),
                                        labelText: 'Dirección del negocio',
                                        hintText:
                                            'Ingrese la dirección del Negocio',
                                        icon: Icon(
                                          Icons.location_on,
                                          size: 40,
                                        ),
                                        hintStyle: TextStyle(
                                            color:
                                                Color.fromARGB(164, 3, 3, 4)),
                                      ),
                                      maxLines: 1,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      textDirection: TextDirection.ltr,
                                      autocorrect: true,
                                      enableSuggestions: true,
                                    ),

                                    TextField(
                                      controller: controller
                                          .descriptionBusinessController,
                                      decoration: InputDecoration(
                                        //label: Text('Nombre Completo'),
                                        labelText: 'Descripción del negocio',
                                        hintText:
                                            'Ingrese una descripción del Negocio',
                                        icon: Icon(
                                          Icons.info,
                                          size: 40,
                                        ),
                                        hintStyle: TextStyle(
                                            color:
                                                Color.fromARGB(164, 3, 3, 4)),
                                      ),
                                      maxLines: 1,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      textDirection: TextDirection.ltr,
                                      autocorrect: true,
                                      enableSuggestions: true,
                                    ),
                                    //Text Nombre Completo
                                    TextField(
                                      controller:
                                          controller.firstnameController,
                                      decoration: InputDecoration(
                                        //label: Text('Nombre Completo'),
                                        labelText: 'Nombres',
                                        hintText:
                                            'Ingrese sus nombres completo',
                                        icon: Icon(
                                          Icons.account_circle,
                                          size: 40,
                                        ),
                                        hintStyle: TextStyle(
                                            color:
                                                Color.fromARGB(164, 3, 3, 4)),
                                      ),
                                      maxLines: 1,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      textDirection: TextDirection.ltr,
                                      autocorrect: true,
                                      enableSuggestions: true,
                                    ),

                                    TextField(
                                      controller: controller.surnameController,
                                      decoration: InputDecoration(
                                        //label: Text('Nombre Completo'),
                                        labelText: 'Apellidos',
                                        hintText:
                                            'Ingrese sus apellidos completos',
                                        icon: Icon(
                                          Icons.account_circle,
                                          size: 40,
                                        ),
                                        hintStyle: TextStyle(
                                            color:
                                                Color.fromARGB(164, 3, 3, 4)),
                                      ),
                                      maxLines: 1,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      textDirection: TextDirection.ltr,
                                      autocorrect: true,
                                      enableSuggestions: true,
                                    ),

                                    //Text Numero DNI Completo
                                    TextFormField(
                                        onChanged: (value) {
                                          //Obtener_Usuario_RENIEC(value.toString());
                                        },
                                        keyboardType: TextInputType.number,
                                        controller:
                                            controller.documentController,
                                        decoration: const InputDecoration(
                                            //label: Text('Nombre Completo'),
                                            labelText: 'DNI',
                                            hintText: 'Ingrese su dni',
                                            icon: Icon(
                                              Icons.add_card_rounded,
                                              size: 40,
                                            )),
                                        maxLines: 1,
                                        maxLength: 8,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        obscureText: false,
                                        textDirection: TextDirection.ltr,
                                        autocorrect: true,
                                        enableSuggestions: true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty)
                                            return 'Campo Obligatorio';
                                          return null;
                                        }),

                                    //Text Clave Completo
                                    TextField(
                                      controller: controller.passwordController,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        hintText: 'Ingrese su contraseña',
                                        icon: Icon(
                                          Icons.security_rounded,
                                          size: 40,
                                        ),
                                        hintStyle: TextStyle(
                                            color:
                                                Color.fromARGB(164, 3, 3, 4)),
                                      ),
                                      maxLines: 1,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: true,
                                      textDirection: TextDirection.ltr,
                                      autocorrect: true,
                                      enableSuggestions: true,
                                    ),

                                    //Text Confirmacion Clave Completo
                                    const SizedBox(height: 10),
                                    TextField(
                                      controller:
                                          controller.password2Controller,
                                      decoration: InputDecoration(
                                        //label: Text('Nombre Completo'),
                                        labelText: 'Confirmacion de Password',
                                        hintText: 'Repita la contraseña',
                                        icon: Icon(
                                          Icons.password_outlined,
                                          size: 40,
                                        ),
                                        hintStyle: TextStyle(
                                            color:
                                                Color.fromARGB(164, 3, 3, 4)),
                                      ),
                                      maxLines: 1,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: true,
                                      textDirection: TextDirection.ltr,
                                      autocorrect: true,
                                      enableSuggestions: true,
                                    ),

                                    // const SizedBox(height: 30),

                                    // Align(
                                    //   alignment: Alignment.topLeft,
                                    //   child: Row(
                                    //     children: [
                                    //       Icon(Icons.verified_user_sharp,
                                    //           size: 40,
                                    //           color:
                                    //               Color.fromARGB(164, 3, 3, 4)),
                                    //       SizedBox(width: 10),
                                    //       Text('Seleccione el rol'),
                                    //     ],
                                    //   ),
                                    // ),

                                    //ComboBox
                                    // Container(
                                    //   padding: EdgeInsets.only(
                                    //       left:
                                    //           60), // Ajusta el margen izquierdo según tus necesidades
                                    //   child: DropdownButtonFormField(
                                    //     // value: cb_IdRol,
                                    //     icon: const Icon(
                                    //         Icons.arrow_circle_down_rounded),
                                    //     items: ['ADMINISTRADOR', 'CLIENTE']
                                    //         .asMap()
                                    //         .map((index, item) => MapEntry(
                                    //               index,
                                    //               DropdownMenuItem(
                                    //                 value: index + 1,
                                    //                 child: Text(item),
                                    //               ),
                                    //             ))
                                    //         .values
                                    //         .toList(),
                                    //     onChanged: (value) {
                                    //       setState(() {
                                    //         // cb_IdRol = value!;
                                    //       });
                                    //     },
                                    //   ),
                                    // ),

                                    const SizedBox(height: 30),

                                    //Boton Guardar Registro
                                    ElevatedButton(
                                      onPressed: () {
                                        controller.signUpBusiness(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(300, 40),
                                          backgroundColor:
                                              const Color(0xFF35AF86),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      child: const Text('Registrar',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 20)),
                                    ),

                                    const SizedBox(height: 10),
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
            )
          ]),
        ),
      ),
    );
  }
}











// // 
// import 'package:app_bicirrenta/Administrador/Empresa/Listado_Empresa.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';


// File? _image;

// class Negocios extends StatelessWidget{
//    const Negocios({super.key});
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp( 
//       debugShowCheckedModeBanner: false,
//       routes: {
//         '/':(context) => const Registro_Negocios(),
//       },
//     );
//   }
// }

// class Registro_Negocios extends StatefulWidget {
//   const Registro_Negocios({super.key});

//   @override
//   State<Registro_Negocios> createState() => _Registro_NegocioState();
// }
 
// class _Registro_NegocioState extends State<Registro_Negocios> {
 

//   Future<void> Seleccionar_Imagen() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       setState(() {
//         _image = File(image.path);
//         if(_image != null)
//         {
           
//         }
//       });
//     }
//   }
  
  
//   @override
//   Widget build(BuildContext context) { 
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
        

//         appBar: AppBar(
//           flexibleSpace: Container(
//             margin: EdgeInsets.only(top: 46, right: 8),
//             height: 300,
//             alignment: Alignment.centerRight,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
                    
//                     Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.arrow_back),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => ListadoNegocios()),
//                             );
//                           },
//                         ),

                        
//                       ],
                      
//                     ),

//                     SizedBox(height: 5),
//                     Container(
//                       margin: EdgeInsets.only(left: 18),
//                       child: Text(
//                         "REGISTRO TU NEGOCIO",
//                         style: const TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Image.asset(
//                   'assets/images/Logo_nombre.jpg',
//                   height: 28,
//                 ),
//               ],
//             ),
//           ),
//           elevation: 1,
//           centerTitle: true,
//           toolbarHeight: 110,
//           backgroundColor: Color(0xFF4FC1B0),
//         ),
         
//         body: Container( 
//           child: Stack(
//             children: [
              
//               SingleChildScrollView(
//                 child: Column(
//                    children: [
//                     const SizedBox(height: 20),
                     
//                     Container(
//                       width: double.infinity,
//                       //la altura 
//                       //height: 450,
//                       padding: const EdgeInsets.all(20),
//                       margin: const EdgeInsets.symmetric(horizontal: 14),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: const [
//                           BoxShadow(
//                             color:Colors.black12,
//                             blurRadius: 15,
//                             offset: Offset(0,5)
//                           )
//                         ]
//                       ),
              
//                       child: Column(
//                         children: [
                          
//                           SizedBox(height: 10), 
//                              //Text Nombre Completo
//                               Container(
//                                child: Form(
//                                 child: Container(
//                                   child: Center(
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [

//                                         //Text Nombre Completo
//                                         const TextField(
//                                           //controller: txtNombre_Usuario,
//                                           decoration: InputDecoration(
//                                             //label: Text('Nombre Completo'),
//                                             labelText: 'Nombre Negocio',
//                                             hintText: 'Ingrese el nombre',
//                                             icon: Icon(Icons.business, size: 40,),
//                                             hintStyle: TextStyle(color: Color.fromARGB(164, 3, 3, 4)),
//                                           ),
//                                           maxLines: 1,
//                                           textCapitalization: TextCapitalization.words,
//                                           obscureText: false,
//                                           textDirection: TextDirection.ltr,
//                                           autocorrect: true,
//                                           enableSuggestions: true,
//                                         ), 

//                                         const SizedBox(height: 20),
                                                   
                                         
                                        
                                         

//                                         const SizedBox(height: 30),

//                                         Align(
//                                           alignment: Alignment.topLeft,
//                                           child: Row(
//                                             children: [
//                                               Icon(Icons.image, size: 40, color: Color.fromARGB(164, 3, 3, 4)),
//                                               SizedBox(width: 10),
//                                                 ElevatedButton(
//                                               onPressed: (){
//                                                 Seleccionar_Imagen(); 
//                                               },
//                                                 style: ElevatedButton.styleFrom(
//                                                   minimumSize: const Size(200, 40),
//                                                   backgroundColor: Color.fromARGB(255, 12, 232, 166),
//                                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
//                                                 ),
//                                                 child: const Text('Selecciona una imagen',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20)),

//                                               ),
//                                             ],
//                                           ),
//                                         ),

//                                         SizedBox(height: 20),

//                                         Container(
//                                           width: 200,  // Puedes ajustar el ancho según tus necesidades
//                                           height: 200, // Mantén el mismo alto
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             color: Color.fromARGB(160, 24, 140, 176),
//                                           ),
//                                           child: _image == null
//                                             ? Center(child: Text('No hay imagen'))
//                                             : ClipOval(
//                                                 child: Image.file(
//                                                   _image!,
//                                                   fit: BoxFit.cover, // Ajusta la imagen para que cubra completamente el círculo
//                                                 ),
//                                               ),
//                                         ),
 
//                                         SizedBox(height: 35),
                                         
 
//                                         //Boton Guardar Registro 
//                                         ElevatedButton(
//                                           onPressed: (){
//                                             //Guardar_Bicicleta();
//                                           },
//                                           style: ElevatedButton.styleFrom(
//                                             minimumSize: const Size(300, 40),
//                                             backgroundColor: const Color(0xFF35AF86), 
//                                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
//                                           ),
//                                           child: const Text('Guardar',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20)),

//                                         ),

//                                         const SizedBox(height: 10),

//                                         //Boton Cancelar o Regresar al Inicio_Sesion
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(builder: (context) => ListadoNegocios()),
//                                             );
//                                           },                    
//                                           style: ElevatedButton.styleFrom(
//                                             minimumSize: const Size(300, 40),
//                                             backgroundColor: const Color(0xFF4FC1B0), 
//                                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
//                                           ),
//                                           child: const Text('Cancelar', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20)),
//                                         ), 
//                                       ],
//                                     ),
//                                   ),
//                               ),
//                             ),
//                             )
//                         ]
//                       )
//                     ),
              
//                     //fuera
//                     SizedBox(height: 20),
//                     //Text('Roger chavez', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                    ],
//                 ),
//               )
//             ]
//           ),
//         ),

//       ),
//     );
//   }
// }