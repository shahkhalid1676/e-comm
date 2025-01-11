import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comm/models/product_model.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class ProductDetailsScreen extends StatefulWidget {

   const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text("Products Details"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            // product image
        CarouselSlider(
        items: widget.
            .map(
            (imageUrls) => ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(
        imageUrl: imageUrls,
        fit: BoxFit.cover,
        width: Get.width - 10,
        placeholder: (context, url) => ColoredBox(
          color: Colors.white,
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    ),
    )
        .toList(),
    options: CarouselOptions(
    scrollDirection: Axis.horizontal,
    autoPlay: true,
    aspectRatio: 2.5,
    viewportFraction: 1,
    ),
        ),

          ],
        ),
      ),
    );
  }
}
