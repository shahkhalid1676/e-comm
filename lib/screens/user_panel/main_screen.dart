import 'package:e_comm/screens/auth_ui/wellcome_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
        backgroundColor: AppConstant.appSecondaryColor,
        centerTitle: true,
        actions: [GestureDetector(onTap: ()async{
          GoogleSignIn googleSignIn=GoogleSignIn();
          await googleSignIn.signOut();
          Get.offAll(()=>WelcomeScreen());

        },
            child: Icon(Icons.logout))],
      ),
    );
  }
}
