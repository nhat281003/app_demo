import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
    required this.textContent,
    this.onTap,
    this.style,
    this.padding,
    this.margin,
    this.border,
  }) : super(key: key);
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? color;
  final String textContent;
  final Function()? onTap;
  final TextStyle? style;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(borderRadius ?? 4), border: border),
        child: Center(child: Text(textContent, style: style)),
      ),
    );
  }
}
