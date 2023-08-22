import 'package:flutter/material.dart';

class ContainerCustom extends StatelessWidget {
  const ContainerCustom({Key? key, this.color = Colors.white, this.padding = const EdgeInsets.symmetric(horizontal: 16,vertical: 16), this.margin = const EdgeInsets.symmetric(horizontal: 16), this.child, this.borderRadius = const BorderRadius.all(Radius.circular(10)), this.border, this.width, this.height,this.onTap}) : super(key: key);
  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final BoxBorder? border;
  final double? width;
  final double? height;
  final Function()? onTap;


  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        width: width,
        height:height,
        decoration: BoxDecoration(color: color, borderRadius: borderRadius,border: border),
        child: child,
      ),
    );
  }
}
