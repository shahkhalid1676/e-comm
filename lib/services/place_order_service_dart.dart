import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/order_model.dart';
import 'package:e_comm/screens/user_panel/main_screen.dart';
import 'package:e_comm/services/generate_order_id.dart';
import 'package:e_comm/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void placeOrder(
    {required BuildContext context,
    required String customerAddress,
    required String customerName,
    required String customerPhone,
    required String customerDeviceToken}) async {
  final user = FirebaseAuth.instance.currentUser;
  EasyLoading.show(status: "Please Wait...");
  if (user != null) {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("cart")
          .doc(user.uid)
          .collection("cartOrders")
          .get();
      List<QueryDocumentSnapshot> documents = querySnapshot.docs;
      for (var doc in documents) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;
        String orderId = generateOrderId();

        OrderModel cartModel = OrderModel(
          productId: data['productId'],
          categoryId: data['categoryId'],
          productName: data['productName'],
          categoryName: data['categoryName'],
          salePrice: data['salePrice'],
          fullPrice: data['fullPrice'],
          productImages: data['productImages'],
          deliveryTime: data['deliveryTime'],
          isSale: data['isSale'],
          productDescription: data['productDescription'],
          createdAt: DateTime.now(),
          updatedAt: data['updatedAt'],
          productQuantity: data['productQuantity'],
          productTotalPrice: double.parse(data['productTotalPrice'].toString()),
          customerId: user.uid,
          status: false,
          customerName: customerName,
          customerPhone: customerPhone,
          customerAddress: customerAddress,
          customerDeviceToken: customerDeviceToken,
        );

        for (var x = 0; x < documents.length; x++) {
          await FirebaseFirestore.instance
              .collection("orders")
              .doc(user.uid)
              .set({
            "uId": user.uid,
            "customerName": customerName,
            "customerPhone": customerPhone,
            "customerAddress": customerAddress,
            "customerDeviceToken": customerDeviceToken,
            "orderStatus": false,
            "createdAt": DateTime.now(),
          });

          // push order

          await FirebaseFirestore.instance
              .collection("orders")
              .doc(user.uid)
              .collection("confirmOrders")
              .doc(orderId)
              .set(cartModel.toMap());

          // remove order
          await FirebaseFirestore.instance
              .collection("cart")
              .doc(user.uid)
              .collection("cartOrders")
              .doc(cartModel.productId.toString())
              .delete();
        }
      }
      Get.snackbar("Order Confirmed", "Thanks for your time",
      backgroundColor:AppConstant.appMainColor,
      colorText: AppConstant.textColor,duration: Duration(seconds: 3));
      EasyLoading.dismiss();
      Get.offAll(()=>MainScreen());

    } catch (e) {
      print("error $e");
    }
  }
}
