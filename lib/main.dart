import 'package:e_comm/firebase_options.dart';
import 'package:e_comm/screens/auth_ui/sign_in_screen.dart';
import 'package:e_comm/screens/auth_ui/sign_up_screen.dart';
import 'package:e_comm/screens/auth_ui/splash_screen.dart';
import 'package:e_comm/screens/auth_ui/wellcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E_comm',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
home:WelcomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}


