import 'package:flutter/cupertino.dart';
import 'package:smart_guy/constants/consts.dart';
import 'package:smart_guy/widgets/custom_button.dart';

import '../widgets/custom_avatar.dart';
import '../widgets/custom_text_form_field.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,


        children: [
          // Avatar with edit icon positioned at bottom-right
          CustomAvatar(isSideIconShown: true,),
          SizedBox(height: 2),
          Text(
            "Advisify",

            style: CustomTextStyles.greytitlefont20,
          ),
          SizedBox(height: 3),
          Text(
            "Hussnain",
            style: CustomTextStyles.textlfieldlabeltext.copyWith(
              color:CustomAppColors.primaryColor
            )
          ),
          SizedBox(height: 20),
          CustomInputField(
            title: 'Name',
            controller: nameController,
            label: 'Hussnain',
            imagePathPrefix: "assets/images/user.png",
          ),

          CustomInputField(
            title: 'Your Email',
            controller: emailController,
            label: 'xxx@gmail.com',
            imagePathPrefix: "assets/images/mail.png",
          ),

          CustomInputField(
            title: 'Password',
            controller: passwordController,
            label: '********',
            imagePathPrefix: "assets/images/lock.png",
            suffixIconVisible: true,
            obscureText: _obscurePassword,
            onSuffixIconPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          SizedBox(height: 60),
          CustomButtonWithWithoutIcon(onPressed: (){}, text: "Save",  width: MediaQuery.sizeOf(context).width/2,)
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: ThemeColor.mainClr,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(25),
          //     ),
          //     padding: const EdgeInsets.symmetric(
          //       vertical: 16,
          //       horizontal: 60,
          //     ),
          //   ),
          //
          //   onPressed: () {},
          //   child: const Text(
          //     "Save",
          //     style: TextStyle(color: Colors.white, fontSize: 20),
          //   ),
          // ),
        ],
      ),
    );
  }
}
