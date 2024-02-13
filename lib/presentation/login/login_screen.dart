import 'package:app_bicirrenta/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  LoginController controller = Get.put(LoginController());
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/london-car.jpg"),
                )),
                width: double.infinity,
                height: size.height * 0.32),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 220),

                  Container(
                    width: double.infinity,
                    //la altura
                    //height: 450,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(31, 22, 227, 22),
                              blurRadius: 15,
                              offset: Offset(0, 5))
                        ]),

                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'BIENVENIDO A BICIRENTA',
                          style: TextStyle(
                            color: Color.fromARGB(255, 53, 175, 134),
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Ingrese sus Credenciales',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Form(
                            child: Column(children: [
                              TextFormField(
                                  controller: controller.userController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      //label: Text('Nombre Completo'),
                                      labelText: 'Usuario',
                                      hintText: 'Ingrese su dni',
                                      icon: Icon(
                                        Icons.account_circle_rounded,
                                        size: 30,
                                      )),
                                  maxLines: 1,
                                  maxLength: 8,
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  textDirection: TextDirection.ltr,
                                  autocorrect: true,
                                  enableSuggestions: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Campo Obligatorio';
                                    return null;
                                  }),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: controller.passwordController,
                                decoration: InputDecoration(
                                  suffixIcon: _passwordVisible
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _passwordVisible = false;
                                            });
                                          },
                                          icon: Icon(Icons.visibility_off))
                                      : IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _passwordVisible = true;
                                            });
                                          },
                                          icon: Icon(Icons.visibility)),
                                  labelText: 'Contraseña',
                                  hintText: 'Ingrese su contraseña',
                                  icon: Icon(
                                    Icons.security_outlined,
                                    size: 30,
                                  ),
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(164, 3, 3, 4)),
                                ),
                                maxLines: 1,
                                textCapitalization: TextCapitalization.words,
                                obscureText: _passwordVisible ? true : false,
                                textDirection: TextDirection.ltr,
                                autocorrect: true,
                                enableSuggestions: true,
                              ),
                              SizedBox(height: 10),
                              SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () async {
                                  controller.login(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(300, 40),
                                  backgroundColor: const Color(0xFF35AF86),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                child: const Text(
                                  'INICIAR SESIÓN',
                                  style: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(height: 40),
                              Column(
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "No Tienes Cuenta?",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 27, 28, 29),
                                              fontSize: 14),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              controller.goToRegistrarCliente();
                                            },
                                            child: Text('Registrate',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFF35AF86),
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ]),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: ScreenUtil().setHeight(5),
                                        bottom: ScreenUtil().setHeight(15)),
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Quieres formar parte de nosotros?',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 27, 28, 29),
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        controller.goToRegistrarNegocio();
                                      },
                                      child: Text(
                                        'Registra tú negocio aquí',
                                        style: TextStyle(
                                          color: Colors.orangeAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                ],
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),

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
