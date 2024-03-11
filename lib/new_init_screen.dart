import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_delivery_side/screens/Orders/order_Screen_Naw.dart';
import 'package:grocery_delivery_side/screens/Wallet%20&%20Cod%20Summary/walletSummaryHomescreen.dart';
import 'package:grocery_delivery_side/screens/homeScreen/home_screens.dart';



class NewInitScrren extends StatefulWidget {
  const NewInitScrren({Key? key}) : super(key: key);

  @override
  State<NewInitScrren> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NewInitScrren> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [

    OrderScreenNew(),
    HomeScreen(),
    WalletSummaryHomeScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        color: Colors.white,
        showLabel: false,
        shadowElevation: 5,
        kBottomRadius: 28.0,
        // notchShader: const SweepGradient(
        //   startAngle: 0,
        //   endAngle: pi / 2,
        //   colors: [Colors.red, Colors.green, Colors.orange],
        //   tileMode: TileMode.mirror,
        // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
        notchColor: Colors.black87,

        /// restart app if you change removeMargins
        removeMargins: false,
        bottomBarWidth: 500,
        durationInMilliSeconds: 300,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: SvgPicture.asset(
              "assets/icons/order-1-svgrepo-com.svg",
              color: Colors.blueGrey,
            ),
            activeItem: SvgPicture.asset(
              "assets/icons/order-1-svgrepo-com.svg",
              color: Colors.white,
            ),
            itemLabel: 'Page 3',
          ),
          ///svg example
          BottomBarItem(
            inActiveItem: SvgPicture.asset(
              "assets/icons/home-icon-silhouette-svgrepo-com.svg",
              color: Colors.blueGrey,
            ),
            activeItem: SvgPicture.asset(
              "assets/icons/home-icon-silhouette-svgrepo-com.svg",
              color: Colors.white,
            ),
            itemLabel: 'Page 3',
          ),
          ///svg example
          BottomBarItem(
            inActiveItem: SvgPicture.asset(
              "assets/icons/payment-methods-svgrepo-com.svg",
              color: Colors.blueGrey,
            ),
            activeItem: SvgPicture.asset(
              "assets/icons/payment-methods-svgrepo-com.svg",
              color: Colors.white,
            ),
            itemLabel: 'Page 3',
          ),
        ],
        onTap: (index) {
          /// perform action on tab change and to update pages you can update pages without pages
          // log('current selected index $index');
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
      )
          : null,
    );
  }
}
