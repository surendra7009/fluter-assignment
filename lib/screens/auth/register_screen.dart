import 'package:flutter/material.dart';
import 'package:remote/commons/widgets/custom_button.dart';
import 'package:remote/commons/widgets/custom_text_field.dart';
import 'package:remote/constants/colors.dart';
import 'package:remote/constants/common_textstyles.dart';
import 'package:remote/constants/strings.dart';
import 'package:remote/screens/bottom_nav_screen.dart';
import 'package:remote/screens/profile/profile_screen.dart';
import 'package:remote/screens/remote/remote_control_screen.dart';
import 'package:sizer/sizer.dart';

import '../../commons/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? emailAddress, name;
  bool isProgressBar = false, isRegister = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Container(
            decoration: boxDecoration,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(

                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    const Text(
                      login,
                      style: t46w900cB,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextField(
                          controller: nameController,
                          labelText: emailLabel,
                          hint: emailLabel,
                          obscure: false,
                          iconVisible: false,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return pleaseEnterEmailAddress;
                            } else {}
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextField(
                          controller: emailController,
                          labelText: passwordLabel,
                          hint: passwordLabel,
                          obscure: true,
                          iconVisible: true,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return enterPass;
                            } else{
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomButton(
                            title: login,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const BottomNavScreen(),
                                    ));
                              }
                            }),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              forgotPassword,
                              style: t18b
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
