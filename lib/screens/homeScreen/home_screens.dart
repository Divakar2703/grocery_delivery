import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/data/models/request/indextPageCountRequestModel.dart';
import 'package:grocery_delivery_side/screens/Orders/Componenets/All/simmer_order_list.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_indext_page_count.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../constants.dart';
import '../../data/constants/app_constants_value.dart';
import '../../data/processResponse/status.dart';
import '../../helper/empty_animation.dart';
import 'components/home_header.dart';
import 'components/order_card.dart';
import 'components/payments_card.dart';
import 'components/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late IndextPageCountViewModel indextPageCountViewModel;

  @override
  void initState() {
    super.initState();
    indextPageCountViewModel = IndextPageCountViewModel();
    askLocationPermission();
  }

  void askLocationPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      getHomePageData();
    } else {
      getHomePageData();
      // Handle denied permission
      // You can display a message or navigate the user to a screen where they can manually enable location permission
    }
  }

  void getHomePageData() {
    final indexCountRequestmodel = IndextPageCountRequestModel(
      userId: Constants.userIdForUse,
    );

    indextPageCountViewModel.fetchIndextPageCountData(
      indexCountRequestmodel,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<IndextPageCountViewModel>(
        create: (BuildContext context) => indextPageCountViewModel,
        child: Consumer<IndextPageCountViewModel>(
          builder: (context, value, _) {
            switch (value.indextPageCountData.status ?? "") {
              case Status.LOADING:
                return Center(child: buildShimmerProductDetails());
              case Status.ERROR:
                return Center(child: emptyAnimationWidget());
              case Status.COMPLETED:
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Material(
                        elevation: 4,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 32),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(24),
                              bottomLeft: Radius.circular(24),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              HomeHeader(),
                              SizedBox(
                                height: 15,
                              ),
                              SearchField(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PaymentsCard(
                        TotalOrders:
                        value.indextPageCountData.data?.totalOrders
                            .toString() ??
                            "",
                        CompleteOrders: value.indextPageCountData.data
                            ?.completeOrders.toString() ??
                            "",
                        PackedOrders: value.indextPageCountData.data
                            ?.packedOrders.toString() ??
                            "",
                        TotalCODOrders: value.indextPageCountData.data
                            ?.totalShippingOrders.toString() ??
                            "",
                        TotalshippingOrders: value.indextPageCountData
                            .data?.totalReturnOrders.toString() ??
                            "",
                        TotalReturnOrders: value.indextPageCountData.data
                            ?.totalRejectOrders.toString() ??
                            "",
                        TotalRejectOrders: value.indextPageCountData.data
                            ?.deliveryCancelOrder.toString() ??
                            "",
                        Deliverycancelorder: value.indextPageCountData
                            .data?.totalOnlineOrders.toString() ??
                            "",
                        TotalOnlineOrders: value.indextPageCountData
                            .data?.totalOnlinePaymentCollection
                            .toString() ??
                            "",
                        TotalOnlinePaymentcollection:
                        value.indextPageCountData.data?.totalCODOrders
                            .toString() ??
                            "",
                        TotalCODPaymentcollection: value.indextPageCountData
                            .data?.totalCODPaymentCollection
                            .toString() ??
                            "",
                        TotalPendingCODPayments: value.indextPageCountData
                            .data?.totalPendingCODPayments
                            .toString() ??
                            "",
                      ),
                    ],
                  ),
                );
            }

            return const SizedBox(); // Return an empty SizedBox if status is not loading or completed.
          },
        ),
      ),
    );
  }
}
