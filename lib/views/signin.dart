import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_guy/constants/consts.dart';
import 'package:smart_guy/widgets/custom_text_button.dart';
import 'package:smart_guy/widgets/custom_text_form_field.dart';
import 'package:smart_guy/widgets/scaffold_first.dart';

import '../controller/signin_CTR.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_circular_progress.dart';
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (formKey.currentState!.validate()) {

        setState(() {
          isLoading = true;
        });
        log("------------------------------------------");
        log('prefs ${prefs}');
        bool res = await SignInController(

            rollNo: int.parse('1257'),
            password: _password.text,
            prefs :prefs,
          // schoolDropDownListModel: schoolDropDownListModel!)
        )
            .signIn(context);
        if (!res) {
          setState(() {
            isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: CustomAppColors.errorBackgroundColor,
            // behavior: SnackBarBehavior.floating,
            content: Align(
              alignment: Alignment.topCenter,
              child: Text("Invalid Email or Password "),
            ),
          ));

      }

      // log("message1");
    }
    // else {
    //   log("message2");
    // }
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
                    style: CustomTextSytles.black28.copyWith(
                        height: 0.5
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                          "Dont have an acocunt",
                          style:CustomTextSytles.grey12manrope.copyWith(
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
                  const SizedBox(height: 10),

                  CustomButtonWithWithoutIcon(
                    text: 'Login',

                    onPressed: signInButtonPress,
                  ),

                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Expanded(child: Divider(endIndent: 20,)),


                        Text(
                          "OR",
                          style: TextStyle(color: Colors.grey),

                        ),
                        Expanded(child: Divider(indent: 10,)),
                      ],
                    ),
                  ),

                  CustomButtonWithWithoutIcon(
                    onPressed: ()=>{},
                    text: "Continue With Google",
                    imagePath: "assets/images/google.png",
                    bgColor: Color(0XFFEFEEEC),),
                  SizedBox(height: 8),
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
