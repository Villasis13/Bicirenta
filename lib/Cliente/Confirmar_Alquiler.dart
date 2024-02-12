// 
 
import 'package:app_bicirrenta/Cliente/Cliente.dart';
import 'package:flutter/material.dart'; 
import 'dart:io';
import 'package:image_picker/image_picker.dart';

 


File? _image;
 
//void main() => runApp(const Usuario());


class ConfirmarAlquiler extends StatelessWidget{
   const ConfirmarAlquiler({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => const Confirmar_Alquiler(),
      },
    );
  }
}

class Confirmar_Alquiler extends StatefulWidget {
  const Confirmar_Alquiler({super.key});

  @override
  State<Confirmar_Alquiler> createState() => _Confirmar_AlquilerState();
}
 
class _Confirmar_AlquilerState extends State<Confirmar_Alquiler> {

  Future<void> Seleccionar_Imagen() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
        if(_image != null)
        {
           
        }
      });
    }
  }
  
  
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        

        appBar: AppBar(
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: 46, right: 8),
            height: 300,
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MenuCliente()),
                            );
                          },
                        ),

                        
                      ],
                      
                    ),

                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.only(left: 18),
                      child: Text(
                        "REGISTRO TU NEGOCIO",
                        style: const TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/Logo_nombre.jpg',
                  height: 28,
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
                      //la altura 
                      //height: 450,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color:Colors.black12,
                            blurRadius: 15,
                            offset: Offset(0,5)
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
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos horizontalmente
                                                              children: [
                                                                Text('Tipo:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                                SizedBox(width: 5), // Espacio entre los textos
                                                                Text(
                                                                  'BMX ROJA',
                                                                  style: TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Color(0xFF34B086),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
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
 
                                        SizedBox(height: 35),

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
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos horizontalmente
                                                              children: [
                                                                Text('Alquila bicicleta nueva', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                                                // Espacio entre los textos
                                                                 
                                                              ],
                                                            ),
                                                          ),

                                                          SizedBox(height: 10),
                                                          Container(
                                                            alignment: Alignment.center,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,  // Centra los elementos horizontalmente
                                                              children: [
                                                                SizedBox(width: 5),  
                                                                Text('Marca BMX ROJA, perfecta para', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                                                              ],
                                                            ),
                                                          ),

                                                          SizedBox(height: 10),
                                                          Container(
                                                            alignment: Alignment.center,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,  // Centra los elementos horizontalmente
                                                              children: [
                                                                SizedBox(width: 5),  
                                                                Text('y cualquier tipo de terreno', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                                                           Container(
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos horizontalmente
                                                              children: [
                                                                Text('HORA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                                SizedBox(width: 5), // Espacio entre los textos
                                                                
                                                              ],
                                                            ),
                                                          ),

                                                          

                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              ElevatedButton(
                                                                onPressed: (){
                                                                  // Navigator.pushReplacementNamed(context, '/');
                                                                },                    
                                                                style: ElevatedButton.styleFrom(
                                                                  minimumSize: const Size(40, 30),
                                                                  backgroundColor: const Color(0xFF35AF86), 
                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                                                ),
                                                                
                                                                child: Icon(Icons.remove, color: Color.fromARGB(255, 255, 255, 255), size: 20),
                                                              ),

                                                              Text('1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),


                                                              ElevatedButton(
                                                                onPressed: (){
                                                                  // Navigator.pushReplacementNamed(context, '/');
                                                                },                    
                                                                style: ElevatedButton.styleFrom(
                                                                  minimumSize: const Size(40, 30),
                                                                  backgroundColor: const Color(0xFF35AF86), 
                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                                                ),
                                                                child: Icon(Icons.add, color: Color.fromARGB(255, 255, 255, 255), size: 20),
                                                              ),
                                                            ],
                                                          ),

                                                          SizedBox(height: 10),
                                                          Container(
                                                            alignment: Alignment.center,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,  // Centra los elementos horizontalmente
                                                              children: [
                                                                SizedBox(width: 5),   
                                                                Text('TOTAL: S/. 3.00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                                         
 
                                        //Boton Guardar Registro 
                                        ElevatedButton(
                                          onPressed: (){
                                            //Guardar_Bicicleta();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(300, 40),
                                            backgroundColor: const Color(0xFF35AF86), 
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                          ),
                                          child: const Text('SOLICITAR',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20)),

                                        ),

                                        const SizedBox(height: 10),

                                        //Boton Cancelar o Regresar al Inicio_Sesion
                                        
                                      ],
                                    ),
                                  ),
                              ),
                            ),
                            )
                        ]
                      )
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

      ),
    );
  }
}