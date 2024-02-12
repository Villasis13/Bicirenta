//  
import 'package:flutter/material.dart'; 
import 'Inicio_Solicitud_Bicicleta.dart';


  
class Solicitudes extends StatelessWidget{
   const Solicitudes({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => const Bicicletas_Solicitdas(),
      },
    );
  }
}

class Bicicletas_Solicitdas extends StatefulWidget {
  const Bicicletas_Solicitdas({super.key});

  @override
  State<Bicicletas_Solicitdas> createState() => _Bicicletas_SolicitdasState();
}
 
class _Bicicletas_SolicitdasState extends State<Bicicletas_Solicitdas> {

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[    
    const InicioSolicitudBicicleta(),    
    
  ];
  
 
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // drawer: NavBar(),
        // appBar: AppBar(
        //   flexibleSpace: Container(
        //     margin: EdgeInsets.only(top: 55, right: 8), // Ajusta los márgenes según tus necesidades
        //     height: 300, 
        //     alignment: Alignment.centerRight,
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             SizedBox(height: 38),
        //             Container(
        //               margin: EdgeInsets.only(left: 18), // Ajusta el margen izquierdo del texto
        //               child: Text(
        //                 "TRAFICOS",
        //                 style: const TextStyle(fontSize: 20, color: Colors.white),
        //               ),
        //             ),
        //           ],
        //         ),
        //         Image.asset(
        //           'assets/images/Nombre_logo.png',
        //           height: 40, 
        //         ),
        //       ],
        //     ),
        //   ),
        //   elevation: 1,
        //   centerTitle: true,
        //   toolbarHeight: 110, // Ajusta la altura según la altura del icono 
        //   backgroundColor: Color(0xFF4FC1B0),

        // ),
        
        // body: Container( 
          
        //   child: Stack(
        //     children: [
              
        //       SingleChildScrollView(
        //         child: Column(
        //            children: [
        //             const SizedBox(height: 20),
                     
        //             Container(
        //               width: double.infinity,
        //               //la altura 
        //               //height: 450,
        //               padding: const EdgeInsets.all(20),
        //               margin: const EdgeInsets.symmetric(horizontal: 14),
        //               decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.circular(10),
        //                 boxShadow: const [
        //                   BoxShadow(
        //                     color:Colors.black12,
        //                     blurRadius: 15,
        //                     offset: Offset(0,5)
        //                   )
        //                 ]
        //               ),
              
        //               child: Column(
        //                 children: [
                          
        //                   SizedBox(height: 10), 
        //                      //Text Nombre Completo
        //                       Container(
        //                        child: Form(
        //                         child: Container(
        //                           child: Center(
        //                             child: Column(
        //                               mainAxisAlignment: MainAxisAlignment.start,
        //                               children: [

                                      
        //                               ],
        //                             ),
        //                           ),
        //                       ),
        //                     ),
        //                     )
        //                 ]
        //               )
        //             ),
              
        //             //fuera
        //             SizedBox(height: 20),
        //             //Text('Roger chavez', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        //            ],
        //         ),
        //       )
        //     ]
        //   ),
        // ),

        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),

        // bottomNavigationBar: Container(
        //   decoration: BoxDecoration(
        //     border: Border(
        //       top: BorderSide(width: 1.0, color: Colors.green),
        //     ),
        //   ),
        //   child: BottomNavigationBar(
        //     selectedFontSize: 4,
        //     backgroundColor: Color.fromARGB(255, 252, 255, 252),
        //     items: <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.home_sharp, color: _selectedIndex == 0 ? Color(0xFF34B086) : Color.fromARGB(255, 125, 125, 133), size: 50),
        //         label: '',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.person, color: _selectedIndex == 1 ? Color(0xFF34B086) : Color.fromARGB(255, 125, 125, 133), size: 50),
        //         label: '',
        //       ),
        //     ],
        //     currentIndex: _selectedIndex,
        //     selectedItemColor: Color(0xFF34B086),
        //     selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        //     unselectedItemColor: Colors.white,
        //     onTap: (int index) {
        //       setState(() {
        //         _selectedIndex = index;
        //       });
        //     },
        //     type: BottomNavigationBarType.fixed,
        //     elevation: 10,
        //     selectedIconTheme: IconThemeData(size: 40),
        //     unselectedIconTheme: IconThemeData(size: 40),
        //   ),
        // ),




      ),
    );
  }
}