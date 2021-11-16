import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DrawerHomeSeparador extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const DrawerHomeSeparador({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final name = loginStore.email;
    // final email = loginStore.localizacao;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Theme.of(context).accentColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/lider.png",
                  width: 50,
                  height: 50,
                ),
                const Text(
                  'Gustavo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Ionicons.home,
              color: Colors.black,
            ),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Get.back();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Ionicons.exit_outline,
              color: Colors.black,
            ),
            title: const Text(
              "Sair",
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              Get.defaultDialog(
                title: "Atenção",
                content: Text(
                  "Deseja sair do App?",
                  style: TextStyle(fontSize: 12.sp),
                ),
                onCancel: () {},
                textCancel: "Não",
                onConfirm: () {
                  // Get.offAll(LoginScreen());
                },
                textConfirm: "Sim",
                confirmTextColor: Colors.white,
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
