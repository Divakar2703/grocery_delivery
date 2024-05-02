import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/data/models/request/indextPageCountRequestModel.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_summary.dart';
import 'package:provider/provider.dart';
import '../../../data/constants/app_constants_value.dart';
import '../../../data/processResponse/status.dart';
import '../../../helper/empty_animation.dart';
import '../../../style/colors.dart';
import '../../Orders/Componenets/All/simmer_order_list.dart';

class WalletWidget extends StatefulWidget {
  const WalletWidget({super.key});

  @override
  State<WalletWidget> createState() => _AllWidgetState();
}

class _AllWidgetState extends State<WalletWidget> {
  List<String> items = ['1', '2', '3', '4', '5'];
  String? selectItem = '1';
  late SummaryViewModel summaryViewModel;

  @override
  void initState() {
    super.initState();
    summaryViewModel = SummaryViewModel();
    final data = IndextPageCountRequestModel(userId: Constants.userIdForUse);
    summaryViewModel.fetchWalletSummaryListData(data, context);
  }

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
      child: ChangeNotifierProvider<SummaryViewModel>(
        create: (BuildContext context) => summaryViewModel,
        child: Consumer<SummaryViewModel>(
          builder: (context, value, _) {
            switch (value.walletSummaryListData.status ?? "") {
              case Status.LOADING:
                return Center(child: buildShimmerProductDetails());
              case Status.ERROR:
                return Center(child: emptyAnimationWidget());
              case Status.COMPLETED:
                return Column(
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
                          // const Divider(
                          //   thickness: 1,
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: value.walletSummaryListData.data!.list!
                                .map((item) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),                                  child: Material(
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
                                      border: Border.all(width: 1.0,color: Colors.grey)
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "Date/Time :",
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
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "Description :",
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
                                                "Debit :",
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
                                                "Credit :",
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
                                                "Closing Balance :",
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
                                          const SizedBox(width: 20),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                item.entryDate.toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Muli",
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
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
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                item.description.toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Muli",
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 3),
                                              Text(
                                                item.debit.toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Muli",
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                item.credit.toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Muli",
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                item.closingAmount.toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Muli",
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.blue,
                                                ),
                                                child: Text(
                                                  item.status.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Muli",
                                                    color: Colors.white,
                                                  ),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
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
                          )
                        ],
                      ),
                    ),
                  ],
                );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
