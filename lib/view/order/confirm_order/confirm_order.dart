import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:app_3tv/common/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.75,
                child: ListView(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return _itemOrder();
                      },
                    ),
                    Column(
                      children: [
                        _itemTotal('Subtotal', 'AUD\$30', null),
                        _itemTotal('Delivery', '\$0', null),
                        _itemTotal('Total (incl. VAT)', 'AUD\$30',
                            ColorUtils.COLOR_TEXT_2),
                      ],
                    ),
                    _addMore('Add more items', ColorUtils.COLOR_TEXT_2),
                    _addMore('Add more items', ColorUtils.COLOR_TEXT_1),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: Get.height * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    Get.dialog(
                      Dialog(
                        alignment: Alignment.bottomCenter,
                        child: _displayDialog(),
                      )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorUtils.COLOR_PRIMARY,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size.fromHeight(
                      ConvertHW.removeHW('40h5'),
                    ),
                  ),
                  child: Text('Checkout (AUD \$30)'),
                ),
              ),
            ],
          ),
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

  Widget _itemTotal(String type, String price, Color? colorText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: TextStyleUtils.sizeText16Weight400(),
          ),
          Text(
            price,
            style: TextStyleUtils.sizeText16Weight400()?.copyWith(
              color: colorText == null ? Colors.black87 : colorText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _addMore(String type, Color colorText) {
    return Container(
      margin: EdgeInsets.only(
        top: ConvertHW.removeHW('10h2'),
      ),
      height: ConvertHW.removeHW('35h2'),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorUtils.COLOR_BG_GREY, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: TextStyleUtils.sizeText16Weight400()
                ?.copyWith(color: colorText),
          ),
          Icon(Icons.navigate_next_rounded)
        ],
      ),
    );
  }

  Widget _displayDialog() {
    return Stack(
      children: [
        Container(
          width: ConvertHW.removeHW('80w10'),
          height: ConvertHW.removeHW('80w10'),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorUtils.COLOR_TEXT_2
          ),
        )
      ],
    );
  }
}
