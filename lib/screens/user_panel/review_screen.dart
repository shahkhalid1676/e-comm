import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/order_model.dart';
import 'package:e_comm/models/review_model.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  final OrderModel orderModel;

  const ReviewScreen({super.key, required this.orderModel});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  TextEditingController feedbackController = TextEditingController();
  double productRating=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Reviews"),
        centerTitle: true,
        backgroundColor: AppConstant.appMainColor,
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Add your rating here"),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.teal,
              ),
              onRatingUpdate: (rating) {
              productRating=rating;
              setState(() {

              });
              },
            ),
            SizedBox(
              height: 30,
            ),
            Text("Add Your FeedBack Here"),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: feedbackController,
              decoration:
                  InputDecoration(labelText: "Share Your FeedBack Here"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstant.appMainColor,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12)),
              onPressed: () async{
                EasyLoading.show(status: "Please wait...");
               String feedback=feedbackController.text.trim();
               User? user=FirebaseAuth.instance.currentUser;
               ReviewModel reviewModel= ReviewModel(customerName: widget.orderModel.customerName,
                   customerPhone: widget.orderModel.customerPhone,
                   customerDeviceToken: widget.orderModel.customerDeviceToken,
                   customerId: widget.orderModel.customerId,
                   feedback: feedback,
                   rating: productRating.toString(),
                   createdAt: DateTime.now());
             await  FirebaseFirestore.instance.collection("products").doc(widget.orderModel.productId).collection("reviews").doc(user!.uid).set(reviewModel.toMap());
             EasyLoading.dismiss();

              },
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
