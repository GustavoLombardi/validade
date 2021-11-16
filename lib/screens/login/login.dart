import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:validade/screens/home/home_separador.dart';
import 'package:validade/themes/app_colors.dart';
import 'package:validade/themes/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool senha = true;
  String? keyToken = "";
  bool loading = false;
  bool servidor = false;
  final nomeController = TextEditingController();
  final senhaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void vizualizarSenha() {
    setState(() {
      senha = !senha;
    });
  }

  // void obterServidor() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   ConexaoApp.ip = prefs.getString("ip") ?? "";
  //   ConexaoApp.port = prefs.getString("port") ?? "";
  // }

  void getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nomeController.text = prefs.getString("email") ?? "";
    senhaController.text = prefs.getString("senha") ?? "";
  }

  void saveLogin(String email, String senha) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    prefs.setString("senha", senha);
  }

  // Future<void> login(LoginStore loginStore, PreLoadStore preloadStore) async {
  //   var conexao = await InternetConnectionChecker().connectionStatus;
  //   print(nomeController.text);
  //   if (conexao == InternetConnectionStatus.disconnected) {
  //     Get.defaultDialog(
  //       title: "Erro de Conexão",
  //       content: Text("Você não está conectado a Internet"),
  //     );
  //   } else {
  //     if (formKey.currentState!.validate()) {
  //       setState(() {
  //         loading = true;
  //       });
  //       saveLogin(nomeController.text, senhaController.text);
  //       await loginStore.entrar(
  //         nomeController.text.trim().toUpperCase(),
  //         senhaController.text.trim(),
  //         keyToken ?? " ",
  //         loginStore,
  //       );
  //       if (loginStore.logado!) {
  //         if (loginStore.tipo == "L" || loginStore.tipo == "C") {
  //           Get.offAll(HomeConferenteScreen());
  //         } else if (loginStore.tipo == "S") {
  //           await preloadStore
  //               .buscar(loginStore.idsepconf!, loginStore.localizacao!)
  //               .then(
  //                 (value) => Get.offAll(
  //                   HomeSeparadorScreen(),
  //                 ),
  //               );
  //         }
  //       } else {
  //         setState(() {
  //           loading = false;
  //         });
  //         Get.defaultDialog(
  //           title: "Login Error",
  //           content: Column(
  //             children: [
  //               Text("Dados inválidos!"),
  //               SizedBox(
  //                 height: 10,
  //               ),
  //             ],
  //           ),
  //           onCancel: () {},
  //           textCancel: "Tentar novamente",
  //         );
  //       }
  //     }
  //   }
  // }

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    //FocusScope.of(context).unfocus();
    super.initState();
    getLogin();
  }

  @override
  void dispose() {
    nomeController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () {
          exit(0);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    LottieBuilder.asset(
                      "assets/images/caixa.json",
                      height: 25.h,
                    ),
                    InkWell(
                        onDoubleTap: () {
                          setState(() {
                            servidor = !servidor;
                          });
                        },
                        child: Text(
                          'VALIDADE',
                          style: TextStyles.nomeLogin,
                        )
                        //   Image.asset(
                        //    "assets/images/nomelogo.png",
                        //    height: 15.h,
                        //  ),
                        ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      controller: nomeController,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        labelStyle: const TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite o nome do usuário";
                        } else if (value.length < 4) {
                          return "Nome curto, minímo de 4 letras";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      // onFieldSubmitted: (_) async =>
                      //     await login(loginStore, preLoadStore),
                      controller: senhaController,
                      obscureText: senha,
                      // onTap: (){
                      //   SystemChannels.textInput.invokeMethod('TextInput.hide');
                      // },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: vizualizarSenha,
                          icon: Icon(
                            senha == true ? Ionicons.eye_off : Ionicons.eye,
                            color: senha == true ? Colors.grey : Colors.green,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Senha",
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite uma senha válida";
                        } else if (value.length < 6) {
                          return "Senha curta, minímo de 6 digitos";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    // InkWell(
                    //   onTap: () async {
                    //     print("clicou");
                    //     if (formKey.currentState!.validate()) {
                    //       var conexao = await InternetConnectionChecker()
                    //           .connectionStatus;
                    //       if (conexao == InternetConnectionStatus.connected) {
                    //         await loginStore
                    //             .entrar(nomeController.text,
                    //                 senhaController.text, keyToken!, loginStore)
                    //             .then(
                    //               (value) => saveLogin(
                    //                 nomeController.text,
                    //                 senhaController.text,
                    //               ),
                    //             );

                    //         if (loginStore.logado!) {
                    //           setState(() {
                    //             loading = true;
                    //           });
                    //           Future.delayed(Duration(seconds: 3))
                    //               .then((value) => {
                    //                     if (loginStore.tipo == "C")
                    //                       {Get.offAll(HomeConferenteScreen())}
                    //                     else if (loginStore.tipo == "S")
                    //                       {Get.offAll(HomeSeparadorScreen())}
                    //                   });
                    //         } else {
                    //           Get.defaultDialog(
                    //             title: "Erro Login",
                    //             content: Text("usuário ou senha incorreto!"),
                    //             onCancel: () {},
                    //             textCancel: "Tentar novamente",
                    //           );
                    //         }
                    //       } else {
                    //         Get.defaultDialog(
                    //           title: "Erro de Conexão",
                    //           content: Column(
                    //             children: [Text("Internet não conectada!")],
                    //           ),
                    //           textCancel: "Tentar novamente",
                    //           onCancel: () {},
                    //         );
                    //       }
                    //     }
                    //   },
                    InkWell(
                      onTap: () async {
                        Get.offAll(HomeSeparadorScreen());
                      },
                      child: Container(
                        height: 7.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.login,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 3.h,
                    ),
                    loading
                        ? LottieBuilder.asset(
                            "assets/images/loading.json",
                            // height: 35.h,

                            width: 35.w,
                          )
                        : Container(),
                    servidor
                        ? IconButton(
                            onPressed: () {
                              //  Get.offAll(ServidorScreen());
                            },
                            icon: const Icon(
                              MaterialCommunityIcons.server,
                              color: Colors.black,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
