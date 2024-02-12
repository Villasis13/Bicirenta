 import 'dart:io';
import 'package:app_bicirrenta/Cliente/Confirmar_Alquiler.dart';
import 'package:flutter/material.dart';

File? _image;

class MenuCliente extends StatefulWidget {
  const MenuCliente({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ClienteState();
}

class ClienteState extends State<MenuCliente> {
  int _selectedIndex = 0;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // drawer: Container(
        //   margin: EdgeInsets.only(top: 8),  // Ajusta el espacio superior según tus necesidades
        //   child: NavBar(),
        // ),
        appBar: AppBar(
           flexibleSpace: Container(
            margin: EdgeInsets.only(right: 1),
            //height: 150,
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35),   
                Container(
                  margin: EdgeInsets.only(left: 190),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8), 
                    child: Image.asset(
                      'assets/images/Logo_nombre.jpg',
                      height: 30,
                    ),
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(left: 0,right: 13, top: 60),
                  height: 40,
                  width: MediaQuery.of(context).size.width - 30,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      hintStyle: TextStyle(fontSize: 18, color: Color.fromARGB(255, 125, 125, 133)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(Icons.search, size: 24, color: Color.fromARGB(255, 125, 125, 133)),
                    ),
                    style: TextStyle(fontSize: 18, color: Color(0xFF000000)),
                  ),
                ),
                
              
              ],
            ),
          ),

          elevation: 1,
          centerTitle: true,
          toolbarHeight: 150,
          backgroundColor: Color(0xFF4FC1B0),
        ),

        
        body: Container(
          child: Stack(
            children: [
              SingleChildScrollView(
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
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 12, 232, 166),
                            blurRadius: 1,
                          )
                        ],
                      ),
                      // Tu contenido actual

                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Alinear a la izquierda
                        children: [ 

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
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Text('Bicicleta de', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                SizedBox(width: 5),  // Espacio entre los textos
                                                Text(
                                                  'Multeservicios Chavez',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFF34B086),
                                                  ),
                                                ),

                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,  // Centra los elementos horizontalmente
                                                children: [
                                                  SizedBox(width: 5),  // Espacio entre el texto y el ícono
                                                  Icon(Icons.location_on, size: 30,  color: Color(0xFF34B086),),
                                                  Text('Calle aguas verdes #123', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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

                          SizedBox(height: 20,),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  margin: const EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 211, 220, 227),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]
                                  ),

                                  child: Stack(
                                    alignment: Alignment.center, 
                                    children: [ 
                                      Column(
                                        children: [
                                          Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromARGB(159, 128, 135, 137),
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/Bici_1.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          
                                          SizedBox(height: 1), // Espacio entre la imagen y el texto
                                          Text('BMX ROJA', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                          Text('S/. 3.00 por hora', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)), 

                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(builder: (context) => ConfirmarAlquiler()),
                                                (route) => false,
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 18),
                                              child: Icon(Icons.arrow_forward, size: 30, color: Color(0xFF34B086)),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              
                              SizedBox(width: 10), // Ajusta el espacio entre los contenedores

                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  margin: const EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 211, 220, 227),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]
                                  ),
                                  
                                  child: Stack(
                                    alignment: Alignment.center, 
                                    children: [
                                      // Contenido del Container
                                      Column(
                                        children: [
                                          Container(
                                            width: 200,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromARGB(159, 128, 135, 137),
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/Bici_1.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          
                                          SizedBox(height: 1), // Espacio entre la imagen y el texto
                                          Text('BMX ROJA', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                          Text('S/. 3.00 por hora', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)), 

                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(builder: (context) => ConfirmarAlquiler()),
                                                (route) => false,
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 18),
                                              child: Icon(Icons.arrow_forward, size: 30, color: Color(0xFF34B086)),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          


                          //este el otro cajas de textos
                          SizedBox(height: 15),
                         
                        
                          // Container para el cuadrado
                        ],
                      ),

                    ),
                    SizedBox(height: 20),
                  ],
                ),
              )
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
                icon: Icon(Icons.home_sharp, color: _selectedIndex == 0 ? Color(0xFF34B086) : Color.fromARGB(255, 125, 125, 133), size: 50),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: _selectedIndex == 1 ? Color(0xFF34B086) : Color.fromARGB(255, 125, 125, 133), size: 50),
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
