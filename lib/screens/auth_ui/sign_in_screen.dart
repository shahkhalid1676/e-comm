import 'package:e_comm/controllers/get_user_data_controller.dart';
import 'package:e_comm/controllers/sign_in_controller.dart';
import 'package:e_comm/screens/admin_panel/admin_main_screen.dart';
import 'package:e_comm/screens/auth_ui/forget_password_screen.dart';
import 'package:e_comm/screens/auth_ui/sign_up_screen.dart';
import 'package:e_comm/screens/user_panel/main_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn"),
        centerTitle: true,
        backgroundColor: AppConstant.appSecondaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  controller: userEmail,
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
                child: Obx(() => TextFormField(
                      controller: userPassword,
                      cursorColor: AppConstant.appSecondaryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                signInController.isPasswordVisible.toggle();
                              },
                              child: signInController.isPasswordVisible.value
                                  ? Icon(Icons.visibility_off_sharp)
                                  : Icon(Icons.visibility)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ))),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.all(19),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ForgetPasswordScreen());
                },
                child: Text(
                  "Forget Password",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppConstant.appMainColor),
                ),
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
                    onPressed: () async {
                      String email = userEmail.text.trim();
                      String password = userPassword.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        Get.snackbar("Error", "Please fill all your details");
                      } else {
                        UserCredential? userCredential = await signInController
                            .signInMethod(email, password);
                        var userData= await getUserDataController.getUserData(userCredential!.user!.uid);

                        if (userCredential != null) {
                          if (userCredential.user!.emailVerified) {
                            if(userData[0]["isAdmin"]==true){
                              Get.offAll(()=>AdminMainScreen());
                              Get.snackbar("Success Admin Login",
                                  "Login Successfully",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: AppConstant.textColor,
                                  backgroundColor: AppConstant.appMainColor);
                            }else{
                              Get.offAll(() => MainScreen());
                              Get.snackbar("Success", "User Login Successfully",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: AppConstant.textColor,
                                  backgroundColor: AppConstant.appMainColor);
                            }
    }
                            Get.snackbar("Success", "Login Successfully",
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: AppConstant.textColor,
                                backgroundColor: AppConstant.appMainColor);
                            Get.offAll(() => MainScreen());
                          }else{
                             {
                            Get.snackbar(
                                "Error", "Please verify your email first",
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: AppConstant.textColor,
                                backgroundColor: AppConstant.appMainColor);
                          }
                        }
                      }
                    },
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
              height: Get.height / 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have An Account?  ",
                  style:
                      TextStyle(fontSize: 16, color: AppConstant.appMainColor),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => SignUpScreen());
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 19,
                        color: AppConstant.appMainColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
