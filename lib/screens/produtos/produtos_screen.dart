import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:validade/data/dummy_data.dart';
import 'package:validade/screens/carrinho/carrinho_screen.dart';
import 'package:validade/screens/home/home_separador.dart';
import 'package:validade/themes/app_colors.dart';
import 'package:validade/themes/app_text_styles.dart';

class ProdutosScreen extends StatefulWidget {
  const ProdutosScreen({Key? key}) : super(key: key);

  @override
  _ProdutosScreenState createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  TextEditingController codbarrasController = TextEditingController();
  TextEditingController validade = TextEditingController();

  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 25.h,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.offAll(
                      HomeSeparadorScreen(),
                    );
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 22.sp,
                      ),
                      onPressed: () {
                        BackButton(onPressed: () {});
                      },
                    ),
                  ),
                ),
                Center(
                  child: Badge(
                    animationType: BadgeAnimationType.scale,
                    badgeColor: Colors.green,
                    badgeContent: const Text('2'),
                    // child: LottieBuilder.asset("assets/images/carrinho.json"),
                    child: IconButton(
                      color: Colors.black,
                      icon: Icon(
                        Entypo.shopping_cart,
                        size: 20.sp,
                      ),
                      onPressed: () {
                        Get.to(
                          CarrinhoScreen(),
                        );
                      },
                      iconSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Produtos",
              style: TextStyles.titleEmpresa,
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 2.h,
            ),
          ]),
        ),
        preferredSize: const Size.fromHeight(90),
      ),
      body: ListView(children: [
        InkWell(
          onTap: () {
            setState(() {
              codbarrasController.text = codbarrasController.text;
              FocusScope.of(context).unfocus();
            });
          },
          child: Column(
            children: [
              Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //shadowColor: Colors.white,
                      elevation: 10,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.transparent,
                              margin: const EdgeInsets.only(top: 10),
                              child: TextFormField(
                                focusNode: myFocusNode,
                                controller: codbarrasController,
                                autofocus: true,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    AntDesign.barcode,
                                    color: Colors.black,
                                  ),
                                  focusColor: Colors.black,
                                  labelText: "Código de barras",
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: codbarrasController.text.isEmpty
                                  ? false
                                  : true,
                              child: Column(children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Center(
                                  child: Text(
                                    ' 958 - Agua mineral',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Controle:  S/GÁS',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            labelText: 'Quantidade',
                                            labelStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Expanded(
                                      flex: 1,
                                      child: TextField(
                                        decoration: InputDecoration(
                                            labelText: 'Unidade',
                                            labelStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 200),
                                      child: TextField(
                                        controller: validade,
                                        onTap: () async {
                                          DateTime date = DateTime(1900);
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());

                                          date = (await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2100)))!;
                                          setState(() {
                                            validade.text =
                                                "${date.day}/${date.month}/${date.year}";
                                          });
                                        },
                                        decoration: InputDecoration(
                                            labelText: 'Vencimento',
                                            labelStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                AppColors.background),
                                        onPressed: () {
                                          setState(() {
                                            myFocusNode.requestFocus();
                                            codbarrasController.text = "";
                                            validade.text = "";
                                          });
                                        },
                                        child: const Text(
                                          'Confirmar',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                ),
                              ]),
                            ),
                          ])),
                )
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}
