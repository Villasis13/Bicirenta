import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signup_controller.dart';

class Registro_Usuario extends StatelessWidget {
  Registro_Usuario({super.key});
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'REGISTRO DE USUARIOS',
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
                          'Ingrese sus datos',
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
                                      obscureText: false,
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
                                      obscureText: false,
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
                                        controller.signUp(context);
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
