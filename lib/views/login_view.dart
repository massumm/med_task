import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/auth_controller.dart';
import '../res/app_color.dart';
import '../utils/components/custom_btn.dart';
import '../utils/components/custom_input_field.dart';
import '../utils/components/custom_textview.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.05,left: screenWidth*0.08,right: screenWidth*0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'email'.tr,
                  textColor: AppColors.blackColor,
                  fontSize: 16,
                ),
                CustomInputField(
                  name: 'validEmail'.tr,
                  onChanged: (value) {
                    authController.email.value = value;
                    setState(() {});
                  },
                  onSubmitted: (value){
                    authController.email.value = value;
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                CustomText(
                  text: 'password'.tr,
                  textColor: AppColors.blackColor,
                  fontSize: 16,),
                CustomInputField(
                  name: 'atLeastSixCharacters'.tr,
                  isPassword: true,
                  onChanged: (value) {
                    authController.password.value = value;
                    setState(() {});
                  },
                  onSubmitted: (value){
                    authController.password.value = value;
                  },
                ),
                CustomButton(
                  text:'signIn'.tr,
                  onPressed: () {
                    authController.login();
                  },
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.06),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}