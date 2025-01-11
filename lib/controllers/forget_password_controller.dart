import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Future<void> ForgetPasswordMethod(
      String userEmail,

      ) async {
    try {
      EasyLoading.show(status: "Please wait...");
      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar("Request Sent Successfully",
          "Password Resent link to $userEmail",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppConstant.textColor,
          backgroundColor: AppConstant.appMainColor);



      EasyLoading.dismiss();


    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppConstant.textColor,
          backgroundColor: AppConstant.appMainColor);
    }
  }
}
