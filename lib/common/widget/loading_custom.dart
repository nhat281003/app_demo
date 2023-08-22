import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:flutter/material.dart';


class LoadingCustom extends StatelessWidget {
  const LoadingCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
          color: ColorUtils.COLOR_TEXT_14),
    );
  }
}
