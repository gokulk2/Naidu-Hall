// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:mobileapp/constant/app_constants.dart';
// // import '../constant/color_constants.dart';
// // import '../controller/login_controller.dart';
// // import '../custom_widget/text_form_field.dart';
// // import '../model/response/api_checker.dart';
// //
// // class LoginScreen extends GetView<LoginController> {
// //   LoginScreen({super.key});
// //
// //   final loginController = Get.put(LoginController());
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GetBuilder<LoginController>(initState: (state) {
// //       controller.onBuilderInit();
// //     }, builder: (ctx) {
// //       return Material(
// //         child: SafeArea(
// //           child: LayoutBuilder(builder: (builder, constraint) {
// //             return Form(
// //               key: controller.formKey,
// //               child: Center(
// //                 child: Container(
// //                   width: constraint.maxWidth,
// //                   height: constraint.maxHeight,
// //                   //color: Colors.white,
// //                   // decoration: const BoxDecoration(
// //                   //   image: DecorationImage(
// //                   //     image: AssetImage("asset/logo.png"),
// //                   //     fit: BoxFit.fill,
// //                   //   ),
// //                   // ),
// //
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       Image.asset(
// //                         'asset/logo.png',
// //                         height: 50,
// //                         fit: BoxFit.contain,
// //                       ),
// //                       // Container(
// //                       //   width: 200,
// //                       //   height: 40,
// //                       //   margin: const EdgeInsets.symmetric(
// //                       //     horizontal: 10,
// //                       //     vertical: 30,
// //                       //   ),
// //                       //   decoration: BoxDecoration(
// //                       //     color: pmdButtonColor,
// //                       //     borderRadius: BorderRadius.circular(5),
// //                       //   ),
// //                       //   child: InkWell(
// //                       //     onTap: controller.isLoading ? null : () {},
// //                       //     child: Center(
// //                       //       child: Text(
// //                       //         'Login',
// //                       //         style: TextStyle(
// //                       //           fontWeight: FontWeight.bold,
// //                       //           color: blackColor,
// //                       //           fontSize: 18
// //                       //         ),
// //                       //       ),
// //                       //     ),
// //                       //   ),
// //                       // ),
// //                     Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                       child: PMDButton(
// //                         closeButtonName: 'Login',
// //                         closeEvent: (BuildContext context) {
// //                          // routeToAICADCallSearch();
// //                         },
// //                       ),
// //                    ),
// //                       const SizedBox(height: 20),
// //                       RSTextFormField(
// //                         width: 300,
// //                         // isMandatory: true,
// //                         onChangedEvent: (value) {
// //                           if(value.contains('@'))
// //                           {
// //                             ApiChecker()
// //                                 .warningMessageGetX(header: 'User Name', message: 'Please enter valid User Name');
// //                             return;
// //                           }
// //                         },
// //                         onSavedEvent: (value) {},
// //                         onFieldSubmitted: (value) {
// //                           controller.login();
// //                         },
// //                         textEditingController: controller.userNameController,
// //                         displayName: 'Username',
// //                       ),
// //                       const SizedBox(height: 20),
// //                       RSTextFormField(
// //                         width: 300,
// //                         isPasswordField: true,
// //                         // isMandatory: true,
// //                         onChangedEvent: (value) {},
// //                         onSavedEvent: (value) {},
// //                         onFieldSubmitted: (value) {
// //                           controller.login();
// //                         },
// //                         textEditingController: controller.passwordController,
// //                         displayName: 'Password',
// //                       ),
// //                       const SizedBox(
// //                         height: 20,
// //                       ),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Container(
// //                             width: 100,
// //                             height: 40,
// //                             margin: const EdgeInsets.symmetric(
// //                                 horizontal: 10, vertical: 30),
// //                             decoration: BoxDecoration(
// //                               color: pmdColor,
// //                               borderRadius: BorderRadius.circular(5),
// //                             ),
// //                             child: InkWell(
// //                               onTap: controller.isLoading ? null : () {},
// //                               child: Center(
// //                                 child: Text(
// //                                   'CLEAR',
// //                                   style: TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     color: whiteColor,
// //                                     fontSize: 18
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                           // Padding(
// //                           //   padding: const EdgeInsets.all(8.0),
// //                           //   child: PMDButton2(
// //                           //     closeButtonName: 'CLEAR',
// //                           //     closeEvent: (BuildContext context) {
// //                           //       // routeToAICADCallSearch();
// //                           //     },
// //                           //   ),
// //                           // ),
// //                           //
// //                           // const SizedBox(
// //                           //   width: 50,
// //                           // ),
// //                           // Padding(
// //                           //   padding: const EdgeInsets.all(8.0),
// //                           //   child: PMDButton2(
// //                           //     closeButtonName: 'SUBMIT',
// //                           //     closeEvent: (BuildContext context) {
// //                           //
// //                           //     },
// //                           //   ),
// //                           // ),
// //
// //
// //                           Container(
// //                             width: 100,
// //                             height: 40,
// //                             margin: const EdgeInsets.symmetric(
// //                                 horizontal: 10, vertical: 30),
// //                             decoration: BoxDecoration(
// //                               color: pmdColor,
// //                               borderRadius: BorderRadius.circular(5),
// //                             ),
// //                             child: InkWell(
// //                               onTap: controller.isLoading ? null : () {
// //                                 controller.login();
// //                               },
// //                               child: Center(
// //                                 child: Text(
// //                                   'SUBMIT',
// //                                   style: TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     color: whiteColor,
// //                                     fontSize: 18
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       const SizedBox(
// //                         height: 20,
// //                       ),
// //                       const SizedBox(
// //                           width: 300,
// //                           child: Center(
// //                             child: InkWell(
// //                               child: Text(
// //                                 'Forgot password ?',
// //                                 style: TextStyle(
// //                                   color: Color(0xFFFF6666),
// //                                   fontWeight: FontWeight.bold,
// //                                   fontStyle: FontStyle.italic,
// //                                   fontSize: 18// Change color here
// //                                 ),
// //                               ),
// //                             ),
// //                           )),
// //                             // RSCheckBox1(
// //                             //   checkBoxValue: controller.checkBoxValue,
// //                             //   displayName: 'Remember me',
// //                             //   onChangeEvent: (value) {
// //                             //     controller.checkBoxValue = value;
// //                             //     controller.update();
// //                             //   },
// //                             // ),
// //                             // Padding(
// //                             //   padding: EdgeInsets.only(top: 10.0),
// //
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             );
// //           }),
// //         ),
// //       );
// //     });
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mobileapp/constant/app_constants.dart';
// import '../constant/color_constants.dart';
// import '../controller/login_controller.dart';
// import '../custom_widget/text_form_field.dart';
// import '../model/response/api_checker.dart';
//
// class LoginScreen extends GetView<LoginController> {
//   LoginScreen({super.key});
//
//   final loginController = Get.put(LoginController());
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LoginController>(initState: (state) {
//       controller.onBuilderInit();
//     }, builder: (ctx) {
//       return Material(
//         child: Container(
//           height: MediaQuery.of(context)
//               .size
//               .height, // Set container height to full screen height
//           child: SafeArea(
//             child: LayoutBuilder(builder: (builder, constraint) {
//               return Form(
//                 key: controller.formKey,
//                 child: Center(
//                   child: Container(
//                     width: constraint.maxWidth,
//                     height: constraint.maxHeight,
//                     decoration: const BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(
//                           color: Color(0xFFFF6666),
//                           width: 30.0,
//                         ),
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'asset/logo.png',
//                           height: 50,
//                           fit: BoxFit.contain,
//                         ),
//                         // Padding(
//                         //   padding: const EdgeInsets.all(8.0),
//                         //   child: PMDButton(
//                         //     closeButtonName: 'Login',
//                         //     closeEvent: (BuildContext context) {
//                         //       // routeToAICADCallSearch();
//                         //     },
//                         //   ),
//                         // ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         SizedBox(
//                           width: 150,
//                           // Adjust the width as needed// Adjust the height as needed
//                           child: ElevatedButton(
//                             onPressed: () {
//                               // Add your onPressed logic here
//                             },
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               backgroundColor: pmdButtonColor,
//                             ),
//                             child: const Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 24.0, vertical: 12.0),
//                               child: Text('Login'),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         RSTextFormField(
//                           width: 300,
//                           onChangedEvent: (value) {
//                             if (value.contains('@')) {
//                               ApiChecker().warningMessageGetX(
//                                   header: 'User Name',
//                                   message: 'Please enter valid User Name');
//                               return;
//                             }
//                           },
//                           onSavedEvent: (value) {},
//                           onFieldSubmitted: (value) {
//                             controller.login();
//                           },
//                           textEditingController: controller.userNameController,
//                           displayName: 'Username',
//                         ),
//                         const SizedBox(height: 20),
//                         RSTextFormField(
//                           width: 300,
//                           isPasswordField: true,
//                           onChangedEvent: (value) {},
//                           onSavedEvent: (value) {},
//                           onFieldSubmitted: (value) {
//                             controller.login();
//                           },
//                           textEditingController: controller.passwordController,
//                           displayName: 'Password',
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         // Row(
//                         //   mainAxisAlignment: MainAxisAlignment.center,
//                         //   children: [
//                         //     Container(
//                         //       width: 100,
//                         //       height: 40,
//                         //       margin: const EdgeInsets.symmetric(
//                         //           horizontal: 10, vertical: 30),
//                         //       decoration: BoxDecoration(
//                         //         color: pmdColor,
//                         //         borderRadius: BorderRadius.circular(5),
//                         //       ),
//                         //       child: InkWell(
//                         //         onTap: controller.isLoading
//                         //             ? null
//                         //             : () {
//                         //                 controller.userNameController.clear();
//                         //                 controller.passwordController.clear();
//                         //               },
//                         //         child: Center(
//                         //           child: Text(
//                         //             'CLEAR',
//                         //             style: TextStyle(
//                         //                 fontWeight: FontWeight.bold,
//                         //                 color: whiteColor,
//                         //                 fontSize: 18),
//                         //           ),
//                         //         ),
//                         //       ),
//                         //     ),
//                         //     Container(
//                         //       width: 100,
//                         //       height: 40,
//                         //       margin: const EdgeInsets.symmetric(
//                         //           horizontal: 10, vertical: 30),
//                         //       decoration: BoxDecoration(
//                         //         color: pmdColor,
//                         //         borderRadius: BorderRadius.circular(5),
//                         //       ),
//                         //       child: InkWell(
//                         //         onTap: controller.isLoading
//                         //             ? null
//                         //             : () {
//                         //                 controller.login();
//                         //               },
//                         //         child: Center(
//                         //           child: Text(
//                         //             'SUBMIT',
//                         //             style: TextStyle(
//                         //                 fontWeight: FontWeight.bold,
//                         //                 color: whiteColor,
//                         //                 fontSize: 18),
//                         //           ),
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ],
//                         // ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             ElevatedButton(
//                               onPressed: controller.isLoading
//                                   ? null
//                                   : () {
//                                       controller.userNameController.clear();
//                                       controller.passwordController.clear();
//                                     },
//                               style: ElevatedButton.styleFrom(
//                                 primary: pmdColor,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                   side: const BorderSide(
//                                       color: Colors.blueAccent), // Border color
//                                 ),
//                               ),
//                               child: const Text(
//                                 'CLEAR',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 40),
//                             ElevatedButton(
//                               onPressed: controller.isLoading
//                                   ? null
//                                   : () {
//                                       controller.login();
//                                     },
//                               style: ElevatedButton.styleFrom(
//                                 primary: pmdColor,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.0),
//                                   side: const BorderSide(
//                                       color: Colors.blueAccent), // Border color
//                                 ),
//                               ),
//                               child: const Text(
//                                 'SUBMIT',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const SizedBox(
//                             width: 300,
//                             child: Center(
//                               child: InkWell(
//                                 child: Text(
//                                   'Forgot password ?',
//                                   style: TextStyle(
//                                       color: Color(0xFFFF6666),
//                                       fontWeight: FontWeight.bold,
//                                       fontStyle: FontStyle.italic,
//                                       fontSize: 18 // Change color here
//                                       ),
//                                 ),
//                               ),
//                             )),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ),
//         ),
//       );
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/constant/color_constants.dart';
import '../controller/login_controller.dart';
import '../custom_widget/check_box.dart';
import '../custom_widget/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      initState: (state) {
        loginController.onBuilderInit();
      },
      builder: (ctx) {
        return Scaffold(
          key: formKey,
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: loginController.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 70),
                      child: Image.asset(
                        'asset/logo.png', // Make sure this path is correct
                        height: 60,
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Efficiency Management For Naidu Hall',
                        style: TextStyle(
                          color: Color.fromRGBO(53, 49, 97, 1),
                          fontSize: 18, // Adjust the font size as needed
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      hintText: 'Username',
                      prefixIcon: Icons.person,
                      onChanged: (value) {
                        // Handle username change
                      },
                      onSubmitted: (value) {
                        loginController.login();
                      },
                      textEditingController: loginController.userNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomPasswordTextField(
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      onChanged: (value) {
                        // Handle password change
                      },
                      onSubmitted: (value) {
                        loginController.login();
                      },
                      textEditingController: loginController.passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the password';
                        }
                        return null;
                      },
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RSCheckBox1(
                            checkBoxValue: loginController.checkBoxValue,
                            displayName: 'Remember me',
                            onChangeEvent: (value) {
                              loginController.checkBoxValue = value;
                              loginController.update();
                            },
                          ),
                          const SizedBox(width: 120),
                          TextButton(
                            onPressed: () {
                              // Handle forgot password button press
                            },
                            child: const Text('Forgot password?'),
                          ),
                        ]),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: loginController.isLoading
                          ? null
                          : () {
                              loginController.login();
                            },
                      child: loginController.isLoading
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ) // Show loader when loading
                          : const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
