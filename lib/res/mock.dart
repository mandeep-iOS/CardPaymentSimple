import 'package:flutter/cupertino.dart';
import 'package:paymenttest/export.dart';
import 'package:paymenttest/res/res.dart';

class Mock {
  String get userName => 'Janet Jackson';
  String get date => '30 Jun 2023';
  String idVerification(bool status) =>
      'ID ${status == true ? 'Verified' : 'Not Verified'}';
}

class IntroImage extends StatelessWidget {
  const IntroImage({Key? key, this.onboardImg, this.height}) : super(key: key);
  final String? onboardImg;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 240,
      child: Image.asset(
        onboardImg ?? R.png.onBoardingOne.imgPng,
        fit: BoxFit.cover,
        // isAntiAlias: true,
      ),
    );
  }
}
