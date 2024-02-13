import 'package:app_bicirrenta/Administrador/MenuAdmin.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class InicioSolicitudBicicleta extends StatefulWidget {
  const InicioSolicitudBicicleta({Key? key}) : super(key: key);

  @override
  _InicioSolicitudBicicletaState createState() =>
      _InicioSolicitudBicicletaState();
}

class _InicioSolicitudBicicletaState extends State<InicioSolicitudBicicleta> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: 46, right: 8),
            height: 300,
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrincipalAdmin()),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(left: 0),
                      child: Text(
                        "TRÁFICOS",
                        style: const TextStyle(
                            fontSize: 20, color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/Logo_nombre.jpg',
                  height: 40,
                ),
              ],
            ),
          ),
          elevation: 1,
          centerTitle: true,
          toolbarHeight: 60,
          backgroundColor: Color(0xFF4FC1B0),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'SOLICITUDES'),
              Tab(text: 'ALQUILADOS'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InicioSolicitudes(),
            InicioAlquileres(),
          ],
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
                    MaterialPageRoute(builder: (context) => PrincipalAdmin()),
                    (route) => false,
                  );
                } else if (_selectedIndex == 1) {
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Registro_Usuario()),
                  //   (route) => false,
                  // );
                }
              });
            },
            type: BottomNavigationBarType.fixed,
            elevation: 10,
            selectedIconTheme: IconThemeData(size: 40),
            unselectedIconTheme: IconThemeData(size: 40),
          ),
        ),
      ),
    );
  }
}

class InicioSolicitudes extends StatelessWidget {
  const InicioSolicitudes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Stack(children: [
            SingleChildScrollView(
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
                              child: Container(
                                //height: 150,
                                //width: 200,
                                padding: const EdgeInsets.all(15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 211, 220, 227),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Jorge Tenazoa Dorado',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Solicita Bicicleta',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('BMX ROJA',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Por 1 Hora',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            10, 10, 10, 1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.check,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.clear,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              child: Container(
                                //height: 150,
                                //width: 200,
                                padding: const EdgeInsets.all(15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Jorge Tenazoa Dorado',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Solicita Bicicleta',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('BMX ROJA',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Por 1 Hora',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.check,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.clear,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                            ],
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

                        //este el otro cajas de textos
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                //height: 150,
                                //width: 200,
                                padding: const EdgeInsets.all(15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Jorge Tenazoa Dorado',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Solicita Bicicleta',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('BMX ROJA',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Por 1 Hora',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.check,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.clear,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              child: Container(
                                //height: 150,
                                //width: 200,
                                padding: const EdgeInsets.all(15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Jorge Tenazoa Dorado',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Solicita Bicicleta',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('BMX ROJA',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Por 1 Hora',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.check,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.clear,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                            ],
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

                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                //height: 150,
                                //width: 200,
                                padding: const EdgeInsets.all(15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Jorge Tenazoa Dorado',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Solicita Bicicleta',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('BMX ROJA',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Por 1 Hora',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                              // ElevatedButton(
                                              //   onPressed: (){
                                              //     // Navigator.pushReplacementNamed(context, '/');
                                              //   },
                                              //   style: ElevatedButton.styleFrom(
                                              //     minimumSize: const Size(40, 30),
                                              //     backgroundColor: Color.fromARGB(255, 10, 10, 10),
                                              //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                              //   ),

                                              //   child: Icon(Icons.check, color: Color.fromARGB(255, 255, 255, 255), size: 20),
                                              // ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.clear,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              child: Container(
                                //height: 150,
                                //width: 200,
                                padding: const EdgeInsets.all(15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Jorge Tenazoa Dorado',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Solicita Bicicleta',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('BMX ROJA',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Por 1 Hora',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.check,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.clear,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                            ],
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

                        SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                //height: 150,
                                //width: 200,
                                padding: const EdgeInsets.all(15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Jorge Tenazoa Dorado',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Solicita Bicicleta',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('BMX ROJA',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Por 1 Hora',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.check,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.clear,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              child: Container(
                                //height: 150,
                                //width: 200,
                                padding: const EdgeInsets.all(15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Jorge Tenazoa Dorado',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Solicita Bicicleta',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('BMX ROJA',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Por 1 Hora',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.check,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushReplacementNamed(context, '/');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize: const Size(
                                                        40, 30),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 10, 10, 10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                child: Icon(Icons.clear,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 20),
                                              ),
                                            ],
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
            )
          ]),
        ),
      ),
    );
  }
}

class InicioAlquileres extends StatelessWidget {
  const InicioAlquileres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Stack(children: [
            SingleChildScrollView(
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              flex:
                                  1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            '01:50:20 AM',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                            maxLines:
                                                1, // Ajusta según sea necesario
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              flex:
                                  1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            '09:50:20 AM',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                            maxLines:
                                                1, // Ajusta según sea necesario
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              flex:
                                  1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            '07:30:20 PM',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                            maxLines:
                                                1, // Ajusta según sea necesario
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              flex:
                                  1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            '05:50:20 PM',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                            maxLines:
                                                1, // Ajusta según sea necesario
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              flex:
                                  1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            '11:30:20 AM',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                            maxLines:
                                                1, // Ajusta según sea necesario
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              flex:
                                  1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            '10:20:20 AM',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                            maxLines:
                                                1, // Ajusta según sea necesario
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              flex:
                                  1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            '05:30:20 PM',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                            maxLines:
                                                1, // Ajusta según sea necesario
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              flex:
                                  1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            '03:40:20 PM',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                            maxLines:
                                                1, // Ajusta según sea necesario
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              flex:
                                  1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            '03:30:20 AM',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                            maxLines:
                                                1, // Ajusta según sea necesario
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              flex:
                                  1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            '02:40:40 PM',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                            maxLines:
                                                1, // Ajusta según sea necesario
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                width:
                                    10), // Ajusta el espacio entre los contenedores

                            Expanded(
                              flex:
                                  1, // Ajusta el flex del segundo contenedor para ocupar menos ancho
                              child: Container(
                                padding: const EdgeInsets.all(13),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]),
                                child: Form(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            '02:23:20 PM',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                            maxLines:
                                                1, // Ajusta según sea necesario
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
            )
          ]),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: InicioSolicitudBicicleta(),
  ));
}
