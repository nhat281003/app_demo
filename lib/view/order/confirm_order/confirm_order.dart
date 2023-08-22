import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:app_3tv/common/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtils.appBar(
          context,
          Text(
            'McDonal\'s',
            style: TextStyleUtils.sizeText16Weight400(),
          ),
          null,
          bg: Colors.transparent,
          textColor: Colors.black87),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return _itemOrder();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _itemOrder() {
    return Container(
      margin: EdgeInsets.only(
        top: ConvertHW.removeHW('10h2'),
      ),
      height: ConvertHW.removeHW('80h2'),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorUtils.COLOR_BG_GREY, width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: ConvertHW.removeHW('32w2'),
                height: ConvertHW.removeHW('32w2'),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border:
                      Border.all(width: 0.25, color: ColorUtils.COLOR_BG_GREY),
                ),
                alignment: Alignment.center,
                child: Text(
                  '12',
                  style: TextStyleUtils.sizeText14Weight300()?.copyWith(
                    color: ColorUtils.COLOR_TEXT_2,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: ConvertHW.removeHW('32w2'),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Cookie Sandwich',
                      style: TextStyleUtils.sizeText16Weight400(),
                    ),
                  ),
                  Text(
                    'Shortbread, chocolate turtle cookies, and red velvet.',
                    style: TextStyleUtils.sizeText14Weight400(),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              height: ConvertHW.removeHW('32w2'),
              child: Text(
                'AUD\$10',
                style: TextStyleUtils.sizeText14Weight500()?.copyWith(
                  color: ColorUtils.COLOR_TEXT_2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
