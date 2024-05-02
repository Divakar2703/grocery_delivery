import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_food_summmary.dart';
import 'package:provider/provider.dart';

import '../../../data/constants/app_constants_value.dart';
import '../../../data/models/request/indextPageCountRequestModel.dart';
import '../../../data/processResponse/status.dart';
import '../../../helper/empty_animation.dart';
import '../../../style/colors.dart';
import '../../Orders/Componenets/All/simmer_order_list.dart';

class FoodCodWidget extends StatefulWidget {
  const FoodCodWidget({super.key});

  @override
  State<FoodCodWidget> createState() => _FoodCodWidgetState();
}

class _FoodCodWidgetState extends State<FoodCodWidget> {

  List<String> items = ['1', '2', '3', '4', '5'];
  String? selectItem = '1';
  late FoodSummaryViewModel foodSummaryViewModel;

  @override
  void initState() {
    super.initState();
    foodSummaryViewModel = FoodSummaryViewModel();
    final data = IndextPageCountRequestModel(userId: Constants.userIdForUse);
    foodSummaryViewModel.fetchFoodCodSummaryListData(data, context);
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: ChangeNotifierProvider<FoodSummaryViewModel>(
        create: (BuildContext context) => foodSummaryViewModel,
        child: Consumer<FoodSummaryViewModel>(
          builder: (context, value, _) {
            switch (value.codSummaryListData.status ?? "") {
              case Status.LOADING:
                return Expanded(
                    child: Center(child: buildShimmerProductDetails()));
              case Status.ERROR:
                return Expanded(child: Center(child: emptyAnimationWidget()));
              case Status.COMPLETED:
                return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xfff9f9f9),
                          ),
                          child: Column(
                            children: [

                              // const SelectDateAndSearchDateWalletSummary(),
                              //
                              // const SizedBox(height: 5,),
                              // const Divider(
                              //   thickness: 1,
                              // ),

                              const SizedBox(height: 10,),

                              ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: value.codSummaryListData.data!
                                    .list!.map((item) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
                                    child: Material(

                                      shadowColor: AppColors.lightGreyGreen,
                                      elevation: 3, // Set elevation value as desired
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      child: Container(

                                        padding: const EdgeInsets.fromLTRB(8.0, 12.0, 0.0, 12.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.white,
                                          shape:
                                          BoxShape.rectangle,
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            children: [
                                              const Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "Order Date/Time :",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Muli",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "Order ID :",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Muli",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "Amount :",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Muli",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Status :",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Muli",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 20),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    item.orderDate.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Muli",
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    item.orderId.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Muli",
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    item.amount.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: "Muli",
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  ),
                                                  SizedBox(height: 3),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(horizontal: 8,
                                                        vertical: 2),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(5),
                                                      color: Colors.blue,
                                                    ),
                                                    child: Text(
                                                      item.status.toString(),
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight
                                                            .w500,
                                                        fontFamily: "Muli",
                                                        color: Colors.white,
                                                      ),
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 10,),

                            ],
                          ),
                        ),

                      ],
                    ));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
