// 
import 'package:flutter/material.dart'; 
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'Listado_Bicicletas.dart';


File? _image;

 
//void main() => runApp(const Usuario());


class Bicicletas extends StatelessWidget{
   const Bicicletas({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => const Registro_Bicicletas(),
      },
    );
  }
}

class Registro_Bicicletas extends StatefulWidget {
  const Registro_Bicicletas({super.key});

  @override
  State<Registro_Bicicletas> createState() => _Registro_BicicletaState();
}
 
class _Registro_BicicletaState extends State<Registro_Bicicletas> {


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
                              MaterialPageRoute(builder: (context) => ListadoBicicletas()),
                            );
                          },
                        ),

                        
                      ],
                      
                    ),

                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.only(left: 18),
                      child: Text(
                        "REGISTRO DE BICICLETAS",
                        style: const TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
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

                                        //Text Nombre Completo
                                        const TextField(
                                          //controller: txtNombre_Usuario,
                                          decoration: InputDecoration(
                                            //label: Text('Nombre Completo'),
                                            labelText: 'Nombre Bicicleta',
                                            hintText: 'Ingrese el nombre',
                                            icon: Icon(Icons.directions_bike, size: 40,),
                                            hintStyle: TextStyle(color: Color.fromARGB(164, 3, 3, 4)),
                                          ),
                                          maxLines: 1,
                                          textCapitalization: TextCapitalization.words,
                                          obscureText: false,
                                          textDirection: TextDirection.ltr,
                                          autocorrect: true,
                                          enableSuggestions: true,
                                        ), 

                                        const SizedBox(height: 10),
                                                   
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              Icon(Icons.check_circle, size: 40, color: Color.fromARGB(164, 3, 3, 4)),
                                              SizedBox(width: 10),
                                              Text('Seleccione el tipo de bicicleta'),
                                            ],
                                          ),
                                        ),
                                        
                                        //ComboBox
                                        Container(
                                          padding: EdgeInsets.only(left: 50), // Ajusta el margen izquierdo según tus necesidades
                                          child: DropdownButtonFormField(
                                            // value: cb_IdRol,
                                            icon: const Icon(Icons.arrow_circle_down_rounded),
                                            items: ['Carretera', 'Montañera', 'Ciclocross', 'Pista']
                                                .asMap()
                                                .map((index, item) => MapEntry(
                                                      index,
                                                      DropdownMenuItem(
                                                        value: index + 1,
                                                        child: Text(item),
                                                      ),
                                                    ))
                                                .values
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                // cb_IdRol = value!;
                                              });
                                            },
                                          ),
                                        ),
 

                                        const SizedBox(height: 20),

                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              Icon(Icons.image, size: 40, color: Color.fromARGB(164, 3, 3, 4)),
                                              SizedBox(width: 10),
                                                ElevatedButton(
                                              onPressed: (){
                                                Seleccionar_Imagen(); 
                                              },
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: const Size(200, 40),
                                                  backgroundColor: Color.fromARGB(255, 12, 232, 166),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                                ),
                                                child: const Text('Selecciona una imagen',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20)),

                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(height: 20),

                                        Container(
                                          width: 200,  // Puedes ajustar el ancho según tus necesidades
                                          height: 200, // Mantén el mismo alto
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromARGB(160, 24, 140, 176),
                                          ),
                                          child: _image == null
                                            ? Center(child: Text('No hay imagen'))
                                            : ClipOval(
                                                child: Image.file(
                                                  _image!,
                                                  fit: BoxFit.cover, // Ajusta la imagen para que cubra completamente el círculo
                                                ),
                                              ),
                                        ),

                                        const SizedBox(height: 20),

                                        SizedBox(height: 30),

                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              Icon(Icons.bike_scooter, size: 40, color: Color.fromARGB(164, 3, 3, 4)),
                                              SizedBox(width: 10),
                                              Text('Seleccione el estado'),
                                            ],
                                          ),
                                        ),
                                        
                                        //ComboBox
                                        Container(
                                          padding: EdgeInsets.only(left: 60), // Ajusta el margen izquierdo según tus necesidades
                                          child: DropdownButtonFormField(
                                            // value: cb_IdRol,
                                            icon: const Icon(Icons.arrow_circle_down_rounded),
                                            items: ['DISPONIBLE', 'NO DISPONIBLE']
                                                .asMap()
                                                .map((index, item) => MapEntry(
                                                      index,
                                                      DropdownMenuItem(
                                                        value: index + 1,
                                                        child: Text(item),
                                                      ),
                                                    ))
                                                .values
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                // cb_IdRol = value!;
                                              });
                                            },
                                          ),
                                        ),

                                        
                                        SizedBox(height: 35),
                                        
                                        //Text Clave Completo
                                          const TextField(
                                            
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black
                                                )
                                              ),
                                              labelText: 'Descripcion de la bicicleta',
                                              hintText: 'Ingrese la descripcion',
                                              icon: Icon(Icons.description, size: 40,),
                                              hintStyle: TextStyle(color: Color.fromARGB(164, 3, 3, 4)),
                                            ),
                                            maxLines: null,
                                            keyboardType: TextInputType.multiline,
                                            textCapitalization: TextCapitalization.words,
                                            obscureText: false,
                                            textDirection: TextDirection.ltr,
                                            autocorrect: true,
                                            enableSuggestions: true,
                                          ),


                                        const SizedBox(height: 30),


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
                                          child: const Text('Guardar',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20)),

                                        ),

                                        const SizedBox(height: 10),

                                        //Boton Cancelar o Regresar al Inicio_Sesion
                                        ElevatedButton(
                                           onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Listado_Bicicletas()),
                                            );
                                          },                    
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(300, 40),
                                            backgroundColor: const Color(0xFF4FC1B0), 
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                          ),
                                          child: const Text('Cancelar', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20)),
                                        ), 
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