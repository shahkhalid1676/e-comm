import 'package:e_comm/screens/auth_ui/wellcome_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        backgroundColor: AppConstant.appMainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Wrap(runSpacing: 10, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text("Shah",style: TextStyle(
                color: AppConstant.textColor
              ),
              ),
              subtitle: Text("version 1.0.1",style: TextStyle(
                  color: AppConstant.textColor
              ),),
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: AppConstant.appSecondaryColor,
                child: Text("S",style: TextStyle(
                    color: AppConstant.textColor
                ),),
              ),
            ),
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            thickness: 1.5,
            color: Colors.grey,
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Home",style: TextStyle(
                    color: AppConstant.textColor
                ),),
                leading: Icon(Icons.home,color: Colors.white,),
                trailing: Icon(Icons.arrow_forward,color: Colors.white,),
              )),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Products",style: TextStyle(
                    color: AppConstant.textColor
                ),),
                leading: Icon(Icons.production_quantity_limits,color: Colors.white,),
                trailing: Icon(Icons.arrow_forward,color: Colors.white,),
              )),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Orders",style: TextStyle(
                    color: AppConstant.textColor
                ),),
                leading: Icon(Icons.shopping_bag_outlined,color: Colors.white,),
                trailing: Icon(Icons.arrow_forward,color: Colors.white,),
              )),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Contacts",style: TextStyle(
                    color: AppConstant.textColor
                ),),
                leading: Icon(Icons.help_outline,color: Colors.white,),
                trailing: Icon(Icons.arrow_forward,color: Colors.white,),
              )),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: ListTile(
                onTap: ()async{
                  GoogleSignIn googleSignIn=GoogleSignIn();
                  FirebaseAuth _auth=FirebaseAuth.instance;
                  await _auth.signOut();
                  await googleSignIn.signOut();
                  Get.offAll(()=>WelcomeScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Logout",style: TextStyle(
                    color: AppConstant.textColor
                ),),
                leading: Icon(Icons.logout,color: Colors.white,),
                trailing: Icon(Icons.arrow_forward,color: Colors.white,),
              )),
        ]),

      ),
    );
  }
}
