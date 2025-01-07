import 'package:e_comm/controllers/google_signin_controller.dart';
import 'package:e_comm/screens/auth_ui/sign_in_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondaryColor,
        title: Text("WelCome to my App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Lottie.asset("assets/Animation - 1729670804012.json")),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "Happy Shopping",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: Get.height / 12,
          ),
          Material(
            child: Container(
              width: Get.width / 1.2,
              height: Get.height / 12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppConstant.appMainColor),
              child: TextButton.icon(
                  icon: Image.asset(
                    "assets/Logo-google-icon-PNG.png",
                    width: Get.width / 12,
                    height: Get.height / 12,
                  ),
                  onPressed: () {
                    _googleSignInController.signInWithGoogle();
                  },
                  label: Text(
                    "Sign in with Google",
                    style: TextStyle(
                        color: AppConstant.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          SizedBox(
            height: Get.height / 29,
          ),
          Material(
            child: Container(
              width: Get.width / 1.2,
              height: Get.height / 12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppConstant.appMainColor),
              child: TextButton.icon(
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.to(()=>SignInScreen());
                  },
                  label: Text(
                    "Sign in with Email",
                    style: TextStyle(
                        color: AppConstant.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
