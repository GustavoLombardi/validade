import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:validade/screens/produtos/produtos_screen.dart';
import 'package:validade/themes/app_text_styles.dart';

class CardInventario extends StatelessWidget {
  const CardInventario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  final produtosSeparadorStore = Provider.of<ProdutosSeparadorStore>(context);
    //  final loginStore = Provider.of<LoginStore>(context);
    return Column(
      children: [
        ListTile(
          onTap: () {
            Get.offAll(
               ProdutosScreen(),
            );
          },
          title: Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: Text(
              "Empresa: ",
              style: TextStyles.empresas,
            ),
          ),
          subtitle: const Text(
            "E-16",
            style: TextStyle(color: Colors.white, fontSize: 16),
            // style: TextStyles.empresas,
          ),
        ),
      ],
    );
  }
}
