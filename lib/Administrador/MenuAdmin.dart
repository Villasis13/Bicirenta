 import 'package:flutter/material.dart';
import '../presentation/barra lateral/BarraLateral.dart';

int IdRol = 0;
int IdUsuario = 0;

class PrincipalAdmin extends StatefulWidget {
   const PrincipalAdmin({super.key});
   @override
  State<StatefulWidget> createState() => PrincipalAdminState();
}

class PrincipalAdminState extends State<PrincipalAdmin> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      //title: 'menu principal',
      home: Scaffold(
        //llama a mi clase BarraLateral que es NavBar
        drawer: NavBar(),
        appBar:  AppBar(
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: 46, right: 1),
            height: 300,
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // children: [
                  //   SizedBox(height: 40),
                  //   Container(
                  //     margin: EdgeInsets.only(left: 18),
                  //     child: Text(
                  //       "Roger Chavez Medina",
                  //       style: const TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
                  //     ),
                  //   ),
                  // ],
                ),

                Container(
                  margin: EdgeInsets.only(right: 0, left: 180, top: 10),  // Ajusta el valor del top según tus necesidades
                  child: Image.asset(
                    'assets/images/Logo_nombre.jpg',
                    height: 26,
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(right: 18, top: 40),
                  child: IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.white),  // Ajusta el color aquí
                    onPressed: () {
                      // Fta programar aquí
                    },
                  ),
                ),

              ],
            ),
          ),
          elevation: 1,
          centerTitle: true,
          toolbarHeight: 110,
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
                        ]
                      ),

                      //hasta aqui

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Alinear a la izquierda
                        children: [
                          SizedBox(height: 4), 
                          Row(
                            children: [ 
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  margin: const EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 211, 220, 227),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ]
                                  ),
                                  child: Form(
                                    child: Container(
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.attach_money, size: 60, color: Colors.blue), // Icono de dinero
                                            SizedBox(height: 10), // Ajusta el espacio entre el icono y el texto
                                            Text('Ganancias del dia', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                            SizedBox(height: 20),
                                            Text('S/. 98.50', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                                  
                                  child: Form(
                                    child: Container(
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.attach_money, size: 60, color: Colors.blue), // Icono de dinero
                                            SizedBox(height: 10), // Ajusta el espacio entre el icono y el texto
                                            Text('Total gananacias del mes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                            SizedBox(height: 20),
                                            Text('S/. 20.50', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                                  margin: const EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 211, 220, 227),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 153, 154, 154),
                                        blurRadius: 1,
                                      )
                                    ],
                                  ),
                                  child: Container(
                                    //height: 200, // Ajusta el alto según tus necesidades
                                    width: double.infinity,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('Estadisticas de alquiler', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                          SizedBox(height: 10),
                                          Image.asset( 
                                            'assets/images/estadistica_alquiler.PNG',
                                            fit: BoxFit.cover,
                                            //height: 150, // Ajusta el alto de la imagen según tus necesidades
                                            width: double.infinity,
                                          ),
                                        ],
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
            ]
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