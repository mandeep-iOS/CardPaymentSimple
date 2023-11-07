import 'package:flutter/material.dart';

class TransparentCard extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const TransparentCard({
    Key? key,
    required this.height,
    this.width = double.infinity,
    this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffD9EEFF),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 31),
          child: child),
    );
  }
}
