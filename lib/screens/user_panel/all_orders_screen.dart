
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/controllers/product_price_controller.dart';
import 'package:e_comm/models/cart_model.dart';
import 'package:e_comm/models/order_model.dart';
import 'package:e_comm/screens/user_panel/checkout_screen.dart';
import 'package:e_comm/screens/user_panel/review_screen.dart';
import 'package:e_comm/utils/app_constant.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

import 'package:get/get.dart';



class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({super.key});

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final ProductPriceController productPriceController=Get.put(ProductPriceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text('All Orders'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .doc(user!.uid)
            .collection('confirmOrders')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: Get.height / 5,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No products found!"),
            );
          }

          if (snapshot.data != null) {
            return Container(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final productData = snapshot.data!.docs[index];
                  OrderModel orderModel = OrderModel(
                    productId: productData['productId'],
                    categoryId: productData['categoryId'],
                    productName: productData['productName'],
                    categoryName: productData['categoryName'],
                    salePrice: productData['salePrice'],
                    fullPrice: productData['fullPrice'],
                    productImages: productData['productImages'],
                    deliveryTime: productData['deliveryTime'],
                    isSale: productData['isSale'],
                    productDescription: productData['productDescription'],
                    createdAt: productData['createdAt'],
                    updatedAt: productData['updatedAt'],
                    productQuantity: productData['productQuantity'],
                    productTotalPrice: double.parse(
                        productData['productTotalPrice'].toString()),
                    customerId: productData["customerId"],
                    status: productData["status"],
                    customerName: productData["customerName"],
                    customerPhone: productData["customerPhone"],
                    customerAddress: productData["customerAddress"],
                    customerDeviceToken: productData["customerDeviceToken"],
                  );

                  //calculate price
                  productPriceController.fetchProductPrice();
                  return Card(
                    elevation: 5,
                    color: AppConstant.textColor,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppConstant.appMainColor,
                        backgroundImage:
                        NetworkImage(orderModel.productImages[0]),
                      ),
                      title: Text(orderModel.productName),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(orderModel.productTotalPrice.toString()),
                          SizedBox(width: 12,),
                          orderModel.status!=true ?Row(
                            children: [
                            Icon(Icons.pending,color: Colors.red,),
                            SizedBox(width: 10,),
                            Text("Pending...",style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                            ),)
                          ],):Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Icon(Icons.check,color: Colors.green,),
                            Text("Done",style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.green
                            ),)
                          ],),

                          SizedBox(
                            width: Get.width / 20.0,
                          ),

                          SizedBox(
                            width: Get.width / 20.0,
                          ),

                        ],
                      ),
                      trailing: orderModel.status==true ?ElevatedButton(style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstant.appMainColor,
                          padding: EdgeInsets.fromLTRB(12, 12, 12, 12)
                      ),
                        onPressed: (){
                        Get.to(()=>ReviewScreen(
                          orderModel:orderModel,
                        ));
                        }, child: Text("Review",style: TextStyle(
                          color: Colors.white
                        ),),):SizedBox.shrink(),
                    ),
                   );
                },
              ),
            );
          }

          return Container();
        },
      ),

    );
  }
}