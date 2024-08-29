import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_delivery_side/screens/Orders/orders_list_tab_screen.dart';
import 'package:grocery_delivery_side/screens/razorpay_payment/razorpayQrCodeScreen.dart';
import 'package:grocery_delivery_side/screens/razorpay_payment/razorpay_barcode_popup.dart';
import '../../../constants.dart';
import '../../Orders/food_orders/food_order_list_tab_screen.dart';
import '../../Wallet & Cod Summary/food/foodSummaryScreen.dart';
import '../../Wallet & Cod Summary/grocery/grocerySummaryScreen.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key,}) : super(key: key);


  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement onTap functionality if needed
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const SizedBox(width: 6,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderScreenNew()),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: kPrimaryLightColor,
                      child: SvgPicture.asset('assets/vectors/apple.svg'),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Grocery\norders",
                      style: TextStyle(
                        fontSize: 12, // Adjust font size as needed
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderScreenNewFood()),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: kPrimaryLightColor,
                      child: SvgPicture.asset('assets/vectors/broccoli.svg'),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Food\norders",
                      style: TextStyle(
                          fontSize: 12, // Adjust font size as needed
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GrocerySummaryHomeScreen()),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: kPrimaryLightColor,
                      child: SvgPicture.asset('assets/vectors/cheese.svg'),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Gorcery\nsummary",
                      style: TextStyle(
                          fontSize: 12, // Adjust font size as needed
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FoodSummaryScreen()),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: kPrimaryLightColor,
                      child: SvgPicture.asset('assets/vectors/meat.svg'),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Food\nsummary",
                      style: TextStyle(
                          fontSize: 12, // Adjust font size as needed
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12,),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const RazorPayQRCodeScreen()),
              //     );
              //   },
              //   child: Column(
              //     children: [
              //       CircleAvatar(
              //         radius: 34,
              //         backgroundColor: kPrimaryLightColor,
              //         child: SvgPicture.asset('assets/vectors/broccoli.svg'),
              //       ),
              //       const SizedBox(height: 4),
              //       const Text(
              //         "Razor\npay",
              //         style: TextStyle(
              //             fontSize: 12, // Adjust font size as needed
              //             fontWeight: FontWeight.w500,
              //             color: Colors.grey
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(width: 14,),

            ],
          ),
        ),
      ),
    );
  }
}


