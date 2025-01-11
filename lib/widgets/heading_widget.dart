import 'package:e_comm/utils/app_constant.dart';
import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String headingTitle;
  final String headingSubTitle;
  final VoidCallback onTap;
  final String buttonText;

  const HeadingWidget(
      {super.key,
      required this.headingTitle,
      required this.headingSubTitle,
      required this.onTap,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headingTitle,
                  style: TextStyle(
                      color: Colors.grey.shade800, fontWeight: FontWeight.bold),
                ),
                Text(
                  headingSubTitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            GestureDetector(onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: AppConstant.appSecondaryColor, width: 1.5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppConstant.appSecondaryColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
