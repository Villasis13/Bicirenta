 import 'package:app_bicirrenta/presentation/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});
 
   @override
   State<SplashScreen> createState() => _SplashScreenState();
 }
 
 class _SplashScreenState extends State<SplashScreen> {

   SplashController controller = Get.put(SplashController());

  @override
  void initState() {
    controller.getInitialScreen();
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/profile.jpg'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset('assets/images/logo_V3.png',fit: BoxFit.cover,),
          ),
          SizedBox(height: 80),
          Text('Verficando datos',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
          Text('espere ...',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          CircularProgressIndicator(backgroundColor: Colors.black,)
          ]),
      ),
     );
   }
 }