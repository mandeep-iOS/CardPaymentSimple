import 'package:flutter/material.dart';

class ColoredBoxWithBorder extends StatelessWidget {
  const ColoredBoxWithBorder({
    super.key,
    required this.boxChild,
    this.color,
    this.borderColor,
    this.borderRadius,
    this.padding,
  });
  final Widget boxChild;
  final Color? color;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color: borderColor ?? Colors.transparent)),
      child: ColoredBox(
          color: color ?? Colors.transparent,
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: boxChild,
          )),
    );
  }
}
