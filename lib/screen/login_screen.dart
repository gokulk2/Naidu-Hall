import 'package:NaiduHall/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: loginController.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 12),
                          child: Image.asset(
                            'asset/logo.png', // Make sure this path is correct
                            height: 100,
                            width: 150,
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Production Management\nFor Naidu Hall',
                            style: TextStyle(
                              color: Color.fromRGBO(53, 49, 97, 1),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 50),
                        CustomTextField(
                          hintText: 'Username',
                          prefixIcon: Icons.person,
                          onChanged: (value) {
                          },
                          onSubmitted: (value) {
                            loginController.login();
                          },
                          textEditingController:
                          loginController.userNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),
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
                          textEditingController:
                          loginController.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
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
                            const SizedBox(width: 100),
                            TextButton(
                              onPressed: () {
                              },
                              child: const Text('Forgot password?',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: loginController.isLoading
                              ? null
                              : () {
                            loginController.login();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            //  elevation: 0,
                            //  primary: null,
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xfff7892b), // Yellow
                                  Color(0xfffbb448),// Orange
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(minWidth: 150, minHeight: 50),
                              alignment: Alignment.center,
                              child: loginController.isLoading
                                  ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                                  : const Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}