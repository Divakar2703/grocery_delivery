import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../data/constants/app_constants_value.dart';
import '../../data/models/request/indextPageCountRequestModel.dart';
import '../../data/processResponse/status.dart';
import '../../helper/empty_animation.dart';
import '../../viewmodels/view_model_indext_page_count.dart';
import '../Orders/Componenets/All/simmer_order_list.dart';
import 'components/payments_card.dart';


class GroceryHome extends StatefulWidget {
  const GroceryHome({super.key});

  @override
  State<GroceryHome> createState() => _GroceryHomeState();
}


class _GroceryHomeState extends State<GroceryHome> {
  late IndextPageCountViewModel indextPageCountViewModel;

  @override
  void initState() {
    super.initState();
    indextPageCountViewModel = IndextPageCountViewModel();
    getHomePageData();
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
    return SingleChildScrollView(
      child:
      ChangeNotifierProvider<IndextPageCountViewModel>(
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
