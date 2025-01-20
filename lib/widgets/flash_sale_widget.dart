import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_comm/models/product_model.dart';
import 'package:e_comm/screens/user_panel/product_details_screen.dart';
import 'package:e_comm/utils/app_constant.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('products')
          .where("isSale", isEqualTo: true)
          .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error fetching products."),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: Get.height / 5,
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }

        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("No products found!"),
          );
        }

        return Container(
          height: Get.height / 4.5,
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final productData = snapshot.data!.docs[index];

              // Null Safety while reading data from Firebase
              final ProductModel productModel = ProductModel(
                productId: productData["productId"] ?? "",
                categoryId: productData["categoryId"] ?? "",
                productName: productData["productName"] ?? "",
                categoryName: productData["categoryName"] ?? "",
                salePrice: productData["salePrice"] ?? "0",
                fullPrice: productData["fullPrice"] ?? "0", // Fixed
                productImages: List<String>.from(productData["productImages"] ?? []),
                deliveryTime: productData["deliveryTime"] ?? "",
                isSale: productData["isSale"] ?? false,
                productDescription: productData["productDescription"] ?? "",
                createdAt: productData["createdAt"] ?? "",
                updatedAt: productData["updatedAt"] ?? "", // Fixed
              );

              return GestureDetector(
                onTap: () => Get.to(() =>
                    ProductDetailsScreen(productModel: productModel)),


                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: FillImageCard(
                      borderRadius: 20.0,
                      width: Get.width / 4.0,
                      heightImage: Get.height / 12,
                      imageProvider: CachedNetworkImageProvider(
                        productModel.productImages.isNotEmpty
                            ? productModel.productImages[0]
                            : "https://via.placeholder.com/150", // Fallback image
                      ),
                      title: Center(
                        child: Text(
                          productModel.productName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 10.0),
                        ),
                      ),
                      footer: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rs ${productModel.salePrice}",
                            style: const TextStyle(fontSize: 10),
                          ),

                          Text(
                            "Rs ${productModel.fullPrice}",
                            style: const TextStyle(
                              fontSize: 8,
                              decoration: TextDecoration.lineThrough,
                              color: AppConstant.appMainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
