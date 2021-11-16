import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CardCarrinho extends StatefulWidget {
  CardCarrinho({
    Key? key,
  }) : super(key: key);

  @override
  _CardCarrinhoState createState() => _CardCarrinhoState();
}

class _CardCarrinhoState extends State<CardCarrinho> {
  final _codbarrasController = TextEditingController();
  final _codFornController = TextEditingController();
  final _qtdController = TextEditingController();
  String dropdownValue = 'One';

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    setState(() {
      _codbarrasController.text = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            '965 - Agua Mineral',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        subtitle: Column(children: [
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Text(
                "CONTROLE:\t",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'S/GÁS',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "EAN:\t",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '7891025102113',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              //Row(
              //  children: [
              //    Text(
              //      "EMB:\t",
              //      style: TextStyle(
              //        fontSize: 11.sp,
              //        color: Colors.white,
              //        fontWeight: FontWeight.bold,
              //      ),
              //    ),
              //    Text(
              //      'teste',
              //      style: TextStyle(
              //        fontSize: 11.sp,
              //        color: Colors.white,
              //      ),
              //    ),
              //  ],
              //),

              Column(
                children: [
                  Text(
                    "VALIDADE:\t",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 1),
                  Text(
                    '04/12/2021',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Row(children: [
              Text(
                "QTD:\t",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '6',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        "EMB:\t",
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'CX/10/UN',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ])
          ]),
        ]),
      ),
    );
  }
}
