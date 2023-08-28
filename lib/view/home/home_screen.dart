import 'package:app_3tv/common/constants/image_const.dart';
import 'package:app_3tv/common/constants/size_utils.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/data/model/profilees/profiless.dart';
import 'package:app_3tv/view/dashbroad/dashbroad_page.dart';
import 'package:app_3tv/view/home/home_controller.dart';
import 'package:app_3tv/view/order/order.dart';
import 'package:app_3tv/view/profile/profile_page.dart';
import 'package:app_3tv/view/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _AnimatedBarExampleState();
}

class _AnimatedBarExampleState extends State<HomeScreen> {
  Color colorUnSelect = ColorUtils.COLOR_MENU;
  Color colorSelect = ColorUtils.COLOR_TAM_ANG;
  double heightIcon = ConvertHW.removeHW('26sp4');
  double widthIcon = ConvertHW.removeHW('26sp4');
  TextStyle titleStyle = TextStyle(fontSize: ConvertHW.removeHW('13sp4'));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: StylishBottomBar(
          option: AnimatedBarOptions(
            iconSize: ConvertHW.removeHW('22sp10'),
            barAnimation: BarAnimation.fade,
            iconStyle: IconStyle.Default,
          ),
          items: [
            BottomBarItem(
                unSelectedColor: colorUnSelect,
                icon: Image.asset(
                  homeController.selected == 0
                      ? ImageConst.ICON_HOME_SELECT
                      : ImageConst.ICON_HOME,
                  width: widthIcon,
                  height: heightIcon,
                ),
                //   icon: Image.asset(ImageConst.ICON_QR,width: ConvertHW.removeHW('20sp5'),),
                title: Text('Home', style: titleStyle),
                selectedColor: colorSelect),
            BottomBarItem(
                unSelectedColor: colorUnSelect,
                icon: Image.asset(
                  homeController.selected == SizeUtils.VOTE_PAGE
                      ? ImageConst.ICON_SEARCHS_SELECT
                      : ImageConst.ICON_SEARCHS,
                  width: widthIcon,
                  height: heightIcon,
                ),
                title: Text('Search', style: titleStyle),
                selectedColor: colorSelect),
            BottomBarItem(
                unSelectedColor: colorUnSelect,
                icon: Image.asset(
                  homeController.selected == SizeUtils.GIFT_PAGE
                      ? ImageConst.ICON_ODER_SELECT
                      : ImageConst.ICON_ODER,
                  width: widthIcon,
                  height: heightIcon,
                ),
                selectedColor: colorSelect,
                title: Text('Oders', style: titleStyle)),
            BottomBarItem(
                unSelectedColor: colorUnSelect,
                icon: Image.asset(
                  homeController.selected == SizeUtils.ACCOUNT_PAGE
                      ? ImageConst.ICON_PROFILE_SELECT
                      : ImageConst.ICON_PROFILE,
                  width: widthIcon,
                  height: heightIcon,
                ),
                selectedColor: colorSelect,
                title: Text('Profile', style: titleStyle)),
          ],
          hasNotch: true,
          fabLocation: StylishBarFabLocation.center,
          currentIndex: homeController.selected,
          onTap: (index) {
            FocusManager.instance.primaryFocus?.unfocus();
            homeController.jumpToPage(index);
            setState(() {
              homeController.selected = index;
            });
          },
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: homeController.pageController,
          children: [
            ProfilePage(),
            SearchPage(),
            OrderScreen(),
            ProfilePage(),
          ],
        ),
      );
    });
  }
}
