import 'package:flutter/material.dart';

import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:validade/screens/historico/historico_screen.dart';
import 'package:validade/screens/inventario/inventario_screen.dart';
import 'package:validade/themes/app_text_styles.dart';

// ignore: must_be_immutable
class CardHomeSeparador extends StatefulWidget {
  final String? nome;
  final String? image;

  final int tela;
  const CardHomeSeparador({
    Key? key,
    required this.nome,
    required this.image,
    required this.tela,
  }) : super(key: key);

  @override
  State<CardHomeSeparador> createState() => _CardHomeSeparadorState();
}

class _CardHomeSeparadorState extends State<CardHomeSeparador> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.tela == 1) {
          Get.offAll(
            const InventarioScreen(),
          );
        } else {
          Get.offAll(
            const HistoricoScreen(),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.tela == 1
              ? const Color.fromRGBO(111, 109, 109, 1)
              : widget.tela == 2
                  ? const Color.fromRGBO(224, 79, 95, 1)
                  : widget.tela == 3
                      ? const Color.fromRGBO(147, 241, 216, 1)
                      : Colors.blue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: widget.tela == 1
                  ? const Color.fromRGBO(111, 109, 109, 1)
                  : widget.tela == 2
                      ? const Color.fromRGBO(224, 79, 95, 1)
                      : widget.tela == 3
                          ? const Color.fromRGBO(147, 241, 216, 1)
                          : Colors.blue,
            ),
          ],
        ),
        height: 100.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          alignment: Alignment.center,
          // fit: StackFit.passthrough,
          children: <Widget>[
            Container(
              height: 96,
              width: MediaQuery.of(context).size.width - 10,
              margin: const EdgeInsets.only(left: 46.0),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0),
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 5,
                    color: widget.tela == 1
                        ? const Color.fromRGBO(111, 109, 109, 1)
                        : widget.tela == 2
                            ? const Color.fromRGBO(224, 79, 95, 1)
                            : widget.tela == 3
                                ? const Color.fromRGBO(147, 241, 216, 1)
                                : Colors.blue,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.nome.toString(),
                    style: TextStyles.cardHome,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              alignment: FractionalOffset.topLeft,
              child: Image(
                image: AssetImage(
                  widget.image.toString(),
                ),
                height: 85.0,
                width: 85.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              alignment: FractionalOffset.centerRight,
              child: const Icon(
                MaterialIcons.keyboard_arrow_right,
                size: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
