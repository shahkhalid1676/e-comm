import 'dart:async';

import 'package:e_comm/screens/auth_ui/wellcome_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer(Duration(seconds: 3),(){
     Get.offAll(()=>WelcomeScreen());
     
   });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appMainColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondaryColor,
        title: Text("E_comm"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: Get.width,
              alignment: Alignment.center,
              child: Lottie.asset("assets/Animation - 1729670804012.json"),
            ),
          ),

          Text(AppConstant.appName,style: TextStyle(
            color: AppConstant.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
          Text(AppConstant.createdBy,style: TextStyle(
    color: AppConstant.textColor,
    fontWeight: FontWeight.bold,
    fontSize: 20
    ),),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}
