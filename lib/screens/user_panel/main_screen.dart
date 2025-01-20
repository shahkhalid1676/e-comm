import 'package:e_comm/screens/user_panel/all_categories_screen.dart';
import 'package:e_comm/screens/user_panel/all_flash_sale_product_screen.dart';
import 'package:e_comm/screens/user_panel/cart_screen.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:e_comm/widgets/all_products_widget.dart';
import 'package:e_comm/widgets/banner-widget.dart';
import 'package:e_comm/widgets/categories_widgets.dart';
import 'package:e_comm/widgets/custom_drawer.dart';
import 'package:e_comm/widgets/flash_sale_widget.dart';
import 'package:e_comm/widgets/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'all_products_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen"),
        backgroundColor: AppConstant.appSecondaryColor,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => CartScreen()),
            child: const Icon(Icons.shopping_cart),
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            BannerWidget(),
            HeadingWidget(
              headingTitle: "Categories",
              headingSubTitle: "According to your Budget",
              onTap: () => Get.to(() => AllCategoriesScreen()),
              buttonText: "See More >",
            ),
            CategoriesWidget(),
            HeadingWidget(
              headingTitle: "Flash Sale",
              headingSubTitle: "According to your Budget",
              onTap: () => Get.to(() => AllFlashSaleProductScreen()),
              buttonText: "See More >",
            ),
            FlashSaleWidget(),
            HeadingWidget(
              headingTitle: "All Products",
              headingSubTitle: "According to your Budget",
              onTap: () => Get.to(() => AllProductsScreen()),
              buttonText: "See More >",
            ),
            AllProductsWidget(), // Reusable widget without Scaffold
          ],
        ),
      ),
    );
  }
}
