import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validade/screens/produtos/produtos_screen.dart';
import 'package:validade/themes/app_text_styles.dart';

class CardHistorico extends StatelessWidget {
  const CardHistorico({Key? key}) : super(key: key);

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
              "Empresa: 1",
              style: TextStyles.empresas,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Separador: Leonardo",
                style: TextStyle(color: Colors.white, fontSize: 16),
                // style: TextStyles.empresas,
              ),
              SizedBox(height: 5),
              Text(
                "Data: 11/11/2021",
                style: TextStyle(color: Colors.white, fontSize: 16),
                // style: TextStyles.empresas,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
