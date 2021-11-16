import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:validade/screens/carrinho/components/card_carrinho.dart';
import 'package:validade/screens/home/home_separador.dart';
import 'package:validade/themes/app_colors.dart';
import 'package:validade/themes/app_text_styles.dart';

class CarrinhoScreen extends StatefulWidget {

  CarrinhoScreen({Key? key}) : super(key: key);
  @override
  _CarrinhoScreenState createState() => _CarrinhoScreenState();
}

class _CarrinhoScreenState extends State<CarrinhoScreen> {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
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
                        padding: const EdgeInsets.only(top: 50),
                        child: Icon(
                          Icons.arrow_back,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.offAll(
                          HomeSeparadorScreen(),
                        );
                      },
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Icon(
                          Ionicons.ios_checkmark_done_circle_sharp,
                          color: Colors.green,
                          size: 25.sp,
                        ),
                      ),
                    ),
                      
                    
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Produtos",
                  style: TextStyles.titleEmpresa,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(100),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.white,
                  );
                },
                itemCount: 5,
                itemBuilder: (ctx, i) => Stack(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CardCarrinho()
                      ],
                    ))));
  }
}
