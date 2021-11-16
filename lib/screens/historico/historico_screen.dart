import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:validade/screens/historico/components/card_historico.dart';
import 'package:validade/screens/home/home_separador.dart';
import 'package:validade/themes/app_colors.dart';
import 'package:validade/themes/app_text_styles.dart';

class HistoricoScreen extends StatefulWidget {
  const HistoricoScreen({Key? key}) : super(key: key);

  @override
  _HistoricoScreenState createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
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
                      icon:Padding(
                      padding: const EdgeInsets.only(top: 50),
                        child: Icon(
                          Icons.arrow_back,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Historico",
                  style: TextStyles.titleEmpresa,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(150),
        ),
        body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.white,
            );
          },
          itemCount: 3,
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return const CardHistorico();
          },
        ));
  }
}
