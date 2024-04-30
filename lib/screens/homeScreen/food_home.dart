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

class FoodHome extends StatefulWidget {
  const FoodHome({super.key});

  @override
  State<FoodHome> createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
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
      child: ChangeNotifierProvider<IndextPageCountViewModel>(
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
                        value.indextPageCountData.data?.totalFoodOrders
                            .toString() ??
                            "",
                        CompleteOrders: value.indextPageCountData.data
                            ?.completeFoodOrders.toString() ??
                            "",
                        PackedOrders: value.indextPageCountData.data
                            ?.packedFoodOrders.toString() ??
                            "",
                        TotalCODOrders: value.indextPageCountData.data
                            ?.totalShippingFoodOrders.toString() ??
                            "",
                        TotalshippingOrders: value.indextPageCountData
                            .data?.totalReturnFoodOrders.toString() ??
                            "",
                        TotalReturnOrders: value.indextPageCountData.data
                            ?.totalRejectFoodOrders.toString() ??
                            "",
                        TotalRejectOrders: value.indextPageCountData.data
                            ?.deliveryCancelFoodOrder.toString() ??
                            "",
                        Deliverycancelorder: value.indextPageCountData
                            .data?.totalOnlineFoodOrders.toString() ??
                            "",
                        TotalOnlineOrders: value.indextPageCountData
                            .data?.totalOnlineFoodPaymentCollection
                            .toString() ??
                            "",
                        TotalOnlinePaymentcollection:
                        value.indextPageCountData.data?.totalCODFoodOrders
                            .toString() ??
                            "",
                        TotalCODPaymentcollection: value.indextPageCountData
                            .data?.totalCODFoodPaymentCollection
                            .toString() ??
                            "",
                        TotalPendingCODPayments: value.indextPageCountData
                            .data?.totalPendingFoodCODPayments
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
