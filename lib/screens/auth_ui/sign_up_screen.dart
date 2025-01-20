import 'package:e_comm/controllers/sign_up_controller.dart';
import 'package:e_comm/screens/auth_ui/sign_in_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController _signUpController = Get.put(SignUpController());

  TextEditingController userName = TextEditingController();

  TextEditingController userEmail = TextEditingController();

  TextEditingController userPhone = TextEditingController();

  TextEditingController userCity = TextEditingController();

  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          title: Text("SignUp"),
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
                  child: TextFormField(
                    controller: userName,
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "User Name",
                        prefixIcon: Icon(Icons.person),
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
                    controller: userPhone,
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: "Phone",
                        prefixIcon: Icon(Icons.phone),
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
                    controller: userCity,
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        hintText: "City",
                        prefixIcon: Icon(Icons.location_on_outlined),
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
                        obscureText: _signUpController.isPasswordVisible.value,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  _signUpController.isPasswordVisible.toggle();
                                },
                                child: _signUpController.isPasswordVisible.value
                                    ? Icon(Icons.visibility_off_sharp)
                                    : Icon(Icons.visibility)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ))),
              SizedBox(
                height: 20,
              ),
              Material(
                child: Container(
                  width: Get.width / 3,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppConstant.appMainColor),
                  child: TextButton.icon(
                      onPressed: ()async  {
                        String name=userName.text.trim();
                        String email=userEmail.text.trim();
                        String phone=userPhone.text.trim();
                        String city =userCity.text.trim();
                        String password=userPassword.text.trim();
                        String userDeviceToken="";

                        if(name.isEmpty|| email.isEmpty|| phone.isEmpty|| city.isEmpty|| password.isEmpty)
                        {
                          Get.snackbar("Error", "Please Enter all details",  snackPosition: SnackPosition.BOTTOM,
                              colorText: AppConstant.textColor,
                              backgroundColor: AppConstant.appMainColor);

                        }else{
                          UserCredential? userCredential=await _signUpController.signUpMethod(name, email, phone, city, password, userDeviceToken);

                          if(userCredential!=null){
                            Get.snackbar("Verification Email Sent", "Please Check Your Email",  snackPosition: SnackPosition.BOTTOM,
                                colorText: AppConstant.textColor,
                                backgroundColor: AppConstant.appMainColor);
                            FirebaseAuth.instance.signOut();
                            Get.to(( )=>SignInScreen(),);


                          }
                        }
                      },
                      label: Text(
                        "Sign Up ",
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
                    "Already Have An Account? ",
                    style: TextStyle(
                        fontSize: 16, color: AppConstant.appMainColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => SignInScreen());
                    },
                    child: Text(
                      "Sign In",
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
    });
  }
}
