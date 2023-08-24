import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:app_3tv/routes/app_routes.dart';
import 'package:app_3tv/view/order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});

  final controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  height: ConvertHW.removeHW('120h20'),
                  child: Text(
                    'Your Orders',
                    style: TextStyleUtils.sizeText18Weight500(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ConvertHW.removeHW('10w2'),
                  ),
                  child: Column(
                    children: [
                      _titleOrder('UPPCOMING ORDERS', 'UPCOMING ORDERS', (){}),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.upcomingOrder.length,
                        itemBuilder: (context, index) {
                          var item = controller.upcomingOrder[index];
                          return _itemOrder(item['img'], item['brand'], item['desc'], item['nation'], item['price']);
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.confirmOrder);
                          },
                          child: Text(
                            'Proceed Payment',
                            style: TextStyleUtils.sizeText16Weight500()
                                ?.copyWith(color: ColorUtils.COLOR_TEXT_2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ConvertHW.removeHW('16h2'),
                      ),
                      _titleOrder('PAST ORDERS', 'CLEAR ALL', (){}),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.pastOrder.length,
                        itemBuilder: (context, index) {
                          var item = controller.pastOrder[index];
                          return _itemOrder(item['img'], item['brand'], item['desc'], item['nation'], item['price']);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _itemOrder(
      String imagePath, String nameProduct, String desc, String nation, int price) {
    double sizeImg = ConvertHW.removeHW('110w2');
    double spaceWidth = ConvertHW.removeHW('8w2');
    double spaceImage = ConvertHW.removeHW('10w2');
    double paddingBottom = ConvertHW.removeHW('10h2');
    double paddingItem = ConvertHW.removeHW('8h2');

    return Padding(
      padding: EdgeInsets.only(
        bottom: paddingBottom,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage(
              imagePath,
              ),
              width: sizeImg,
              height: sizeImg,
            ),
          ),
          SizedBox(
            width: spaceImage,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  right: paddingItem, top: paddingItem, bottom: paddingItem),
              height: sizeImg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameProduct,
                    style: TextStyleUtils.sizeText18Weight400(),
                  ),
                  SizedBox(
                    height: spaceWidth,
                  ),
                  Text(desc),
                  SizedBox(
                    height: spaceWidth,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('\$\$'),
                          SizedBox(
                            width: spaceWidth,
                          ),
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorUtils.COLOR_BG_GREY,
                            ),
                          ),
                          SizedBox(
                            width: spaceWidth,
                          ),
                          Text(
                            'Chinese',
                            style: TextStyleUtils.sizeText14Weight400(),
                          ),
                        ],
                      ),
                      Text(
                        'AUD \$10',
                        style: TextStyleUtils.titleBold14Weigh500
                            ?.copyWith(color: ColorUtils.COLOR_PRIMARY),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleOrder(String type, String nameAction, Function func) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: TextStyleUtils.sizeText16Weight400()
              ?.copyWith(color: ColorUtils.COLOR_TITLE),
        ),
        GestureDetector(
          onTap: () => func,
          child: Text(
            nameAction,
            style: TextStyleUtils.sizeText12Weight300(),
          ),
        )
      ],
    );
  }
}
