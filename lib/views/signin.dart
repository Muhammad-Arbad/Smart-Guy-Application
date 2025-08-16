import 'dart:developer';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_guy/constants/consts.dart';
import 'package:smart_guy/widgets/custom_text_button.dart';
import 'package:smart_guy/widgets/custom_text_form_field.dart';
import 'package:smart_guy/widgets/scaffold_first.dart';

import '../controller/signin_CTR.dart';
import '../utils/page_navigation.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_circular_progress.dart';
import '../widgets/scaffold_second.dart';
import 'blur_effect.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignInScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool hidePass = false;

  void signInButtonPress() async {
    FocusScope.of(context).requestFocus(FocusNode());
    ScreenNavigationSlide.navigateReplacement(context,const ScaffoldSecond());
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScaffoldFirst(
          mainBody: Center(child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),

            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Hero(
                    tag: "logo",
                    child: Image.asset(
                      "assets/images/rounded_logo.png",
                      height: MediaQuery.sizeOf(context).height  / 17.6,
                      width: 120,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    "Login to your accout",
                    style: CustomTextStyles.black28.copyWith(
                        height: 0.5
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                          "Dont have an acocunt",
                          style:CustomTextStyles.grey12manrope.copyWith(
                            fontSize: 16,

                          )
                      ),

                      CustomTextButton(onPressed: ()=>{}, title:'Sign Up',textcolor: CustomAppColors.primaryColor,)
                    ],
                  ),

                  SizedBox(height:20),

                  CustomInputField(

                    controller: _email,
                    label: 'Email',
                    imagePathPrefix: "assets/images/email.png",
                    suffixIconVisible: false,
                    color: Colors.white,
                    isEmail: true,
                  ),

                  CustomInputField(

                    controller: _password,
                    label: 'Password',
                    color: Colors.white,
                    imagePathPrefix: "assets/images/key.png",
                    suffixIconVisible: true,
                    obscureText: hidePass,
                    onSuffixIconPressed: () {
                      setState(() {
                        hidePass = !hidePass;
                      });
                    },
                  ),

                  const SizedBox(height: 5),
                  Align(
                      alignment: Alignment.centerRight,
                      child:CustomTextButton(onPressed: ()=>{}, title:'Forget Password?',textcolor: Color( 0xFF4F4F4F))

                  ),
                  const SizedBox(height: 28),

                  CustomButtonWithWithoutIcon(
                    text: 'Login',

                    onPressed: signInButtonPress,
                  ),

                  SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(child: Divider(endIndent: 20,)),


                        Text(
                          "OR",
                          style: TextStyle(color: Colors.grey),

                        ),
                        Expanded(child: Divider(indent: 20,)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Platform.isAndroid?
                  CustomButtonWithWithoutIcon(
                    onPressed: ()=>{},
                    text: "Continue With Google",
                    imagePath: "assets/images/google.png",
                    bgColor: Color(0XFFEFEEEC),):

                  CustomButtonWithWithoutIcon(
                    onPressed: ()=>{},
                    text: "Continue With Apple",
                    imagePath: "assets/images/apple.png",
                    bgColor: Color(0XFFEFEEEC),
                  ),
                  SizedBox(height: 10),


                ],
              ),),
          ),),
        ),
        if (isLoading)
          Stack(
            children: [
              CustomBlurEffect(),
              Center(child: CustomCircularProgressIndicator())
            ],
          ),
      ],
    );
  }
}
