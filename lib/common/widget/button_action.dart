import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:flutter/material.dart';


class ButtonAction extends StatelessWidget {
  const ButtonAction(
      {Key? key,
      required this.name,
      this.colorBackground,
      required this.function,
      required this.width,
      this.height,
      this.textStyle,this.radius,
        this.toUpperCase,
      })
      : super(key: key);
  final String name;
  final Color? colorBackground;
  final Function function;
  final double? width;
  final double? height;
  final double? radius;
  final TextStyle? textStyle;
  final bool? toUpperCase;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        alignment: Alignment.center,
        width: width,
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: height ?? ConvertHW.removeHW('40h10'),
        decoration: BoxDecoration(
          color: colorBackground,
          borderRadius:  BorderRadius.all(Radius.circular(radius ?? 30)),
          gradient: colorBackground != null ? null :  const LinearGradient(
            colors: [
              ColorUtils.COLOR_BG_BUTTON,
              ColorUtils.COLOR_BG_BUTTON_1
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Text(
          toUpperCase != null ? name: name.toUpperCase(),
          maxLines: 1,
          style: textStyle ??
              TextStyleUtils.sizeText13Weight600()
                  ?.copyWith(color: Colors.white,fontSize: ConvertHW.removeHW('13sp4')),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
