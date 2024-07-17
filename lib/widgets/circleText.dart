import 'package:chandranflutter/config/appTextStyle.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../config/appColorConfig.dart';
import 'customText.dart';

class CircleText extends StatelessWidget {
  final String text;
  const CircleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(2, 1), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(2), // border width
          child: Container(
            // or ClipRRect if you need to clip the content
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              shape: BoxShape.circle,
              color: AppColor.lightGray, // inner circle color
            ),
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircleAvatar(
                backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                radius: 8,
                child: CustomText(text: text,textStyle: AppTextStyle.subHeding1.copyWith(color: AppColor.white,fontSize: 16),),
                //Text
              ),
            ),
          )),
    );
  }
}
