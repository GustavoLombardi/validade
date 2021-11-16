import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:validade/screens/home/components/card_home_separador.dart';
import 'package:validade/screens/home/components/drawer_home_separador.dart';
import 'package:validade/themes/app_colors.dart';

class HomeSeparadorScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeSeparadorScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.defaultDialog(
            title: "Atenção",
            content: Text(
              "Deseja sair do App?",
              style: TextStyle(fontSize: 12.sp),
            ),
            onCancel: () {},
            textCancel: "Não",
            onConfirm: () {
              //    Get.offAll(LoginScreen());
            },
            textConfirm: "Sim",
            confirmTextColor: Colors.white,
          );
          return true;
        },
        child: Scaffold(
            key: _scaffoldKey,
            drawer: const DrawerHomeSeparador(),
            backgroundColor: AppColors.background,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.background,
              title: const Text(
                'Olá, Almir',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CardHomeSeparador(
                        tela: 1,
                        nome: 'Inventário',
                        image: 'assets/images/minhas.png',
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      CardHomeSeparador(
                        tela: 2,
                        nome: 'Histórico',
                        image: 'assets/images/disponiveis.png',
                        //   loginStore: loginStore,
                        //   preLoadSeparadorStore: preLoadSeparadorStore,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
