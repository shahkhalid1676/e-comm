import 'package:e_comm/screens/auth_ui/sign_up_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          title: Text("SignIn"),
          centerTitle: true,
          backgroundColor: AppConstant.appSecondaryColor,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 500,
              height: 100,
              child: Lottie.asset("assets/signin.json"),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: Get.width,
                child: TextFormField(
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: Get.width,
                child: TextFormField(
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.visibility_off_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                )),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.all(19),
              child: Text(
                "Forget Password",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppConstant.appMainColor),
              ),
            ),
            Material(
              child: Container(
                width: Get.width / 3,
                height: Get.height / 18,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppConstant.appMainColor),
                child: TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      "Sign in ",
                      style: TextStyle(
                          color: AppConstant.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            SizedBox(
              height: Get.height/28,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have An Account?  ",
                  style:
                      TextStyle(fontSize: 16, color: AppConstant.appMainColor),
                ),
                GestureDetector(
                  onTap: (){
                    Get.offAll(()=>SignUpScreen());
                  },
                  child: Text(
                    "Sign Up",
                    style:
                    TextStyle(fontSize: 19, color: AppConstant.appMainColor,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
