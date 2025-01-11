import 'package:e_comm/screens/auth_ui/wellcome_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:e_comm/widgets/banner-widget.dart';
import 'package:e_comm/widgets/categories_widgets.dart';
import 'package:e_comm/widgets/custom_drawer.dart';
import 'package:e_comm/widgets/flash_sale_widget.dart';
import 'package:e_comm/widgets/heading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90,
              ),
              BannerWidget(),
              HeadingWidget(
                  headingTitle: "Categories",
                  headingSubTitle: "According to your Budget",
                  onTap: () {},
                  buttonText: "See More >"),
              CategoriesWidget(),
              HeadingWidget(
                  headingTitle: "Flash Sale",
                  headingSubTitle: "According to your Budget",
                  onTap: () {},
                  buttonText: "See More >"),
              FlashSaleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
