import 'package:app_bicirrenta/Cliente/clientes_controller.dart';
import 'package:app_bicirrenta/infrastructure/models/bicy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../infrastructure/models/business_model.dart';

class BusinessScreen extends StatelessWidget {
  BusinessScreen({super.key, required this.controllerBusiness});
  final ClientesController controllerBusiness;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientesController>(builder: (_) {
      return (controllerBusiness.isSearch)
          ? FutureBuilder(
              future: controllerBusiness.getSearchBusiness(),
              builder: (context, AsyncSnapshot<List<BusinessModel>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No existen negocios disponibles'),
                    );
                  }
                  return Column(
                    children: snapshot.data!
                        .map((business) => BusinessWidget(
                              business: business,
                              controllerBusiness: controllerBusiness,
                            ))
                        .toList(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          : FutureBuilder(
              future: controllerBusiness.getBusiness(),
              builder: (context, AsyncSnapshot<List<BusinessModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No existen negocios disponibles'),
                    );
                  }
                  return Column(
                    children: snapshot.data!
                        .map((business) => BusinessWidget(
                              business: business,
                              controllerBusiness: controllerBusiness,
                            ))
                        .toList(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasError) {
                  return Column(
                    children: [
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'Ocurrió un error',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
    });
  }
}

class BusinessWidget extends StatelessWidget {
  BusinessWidget({
    super.key,
    required this.business,
    required this.controllerBusiness,
  });
  final BusinessModel business;
  final ClientesController controllerBusiness;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(16),
        vertical: ScreenUtil().setHeight(10),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(255, 12, 232, 166),
        ),
        boxShadow: [
          // BoxShadow(
          //   color: Color.fromARGB(255, 12, 232, 166),
          //   blurRadius: 1,
          // ),
          BoxShadow(
              color: Colors.black.withOpacity(.3),
              offset: Offset(0, 4),
              blurRadius: 9,
              spreadRadius: 0),
        ],
      ), // Tu contenido actual

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Bicicleta de ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(width: 5), // Espacio entre los textos
              Expanded(
                child: Text(
                  business.nameBusiness ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF34B086),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 30,
                color: Color(0xFF34B086),
              ),
              Text(business.addressBusiness ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 20),
          (business.bicys!.isEmpty)
              ? Text(
                  'No existen bicicletas disponibles para este negocio',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF34B086),
                  ),
                )
              : SizedBox(
                  height: ScreenUtil().setHeight(230),
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: business.bicys!.length,
                      itemBuilder: (_, index) {
                        return BicyWidget(
                          bicy: business.bicys![index],
                          controllerBusiness: controllerBusiness,
                        );
                      }),
                )
          // SizedBox(height: 15),
        ],
      ),
    );
  }
}

class BicyWidget extends StatelessWidget {
  BicyWidget({super.key, required this.bicy, required this.controllerBusiness});
  final BicyModel bicy;
  final ClientesController controllerBusiness;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (bicy.statusBicy == '1') controllerBusiness.goToDetailBicy(bicy);
      },
      child: Container(
        width: ScreenUtil().setWidth(160),
        height: ScreenUtil().setHeight(220),
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(4)),
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(50),
              bottom: ScreenUtil().setHeight(10),
            ),
            decoration: BoxDecoration(
              color: (bicy.statusBicy == '0')
                  ? Color(0XFFFFA0A0)
                  : (bicy.statusBicy == '2')
                      ? Color(0XFFBEFF95)
                      : Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    offset: Offset(0, 4),
                    blurRadius: 6,
                    spreadRadius: 0),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  bicy.typeBicy ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text('S/. ${bicy.priceBicy ?? ''} por hora',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(height: ScreenUtil().setHeight(10)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: ScreenUtil().setHeight(120),
              height: ScreenUtil().setWidth(120),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(159, 128, 135, 137),
                image: DecorationImage(
                  image: AssetImage("assets/images/Bici_1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(4),
                vertical: ScreenUtil().setHeight(1),
              ),
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                (bicy.statusBicy == '0')
                    ? 'Ocupado'
                    : (bicy.statusBicy == '2')
                        ? 'Solicitado'
                        : 'Libre',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
