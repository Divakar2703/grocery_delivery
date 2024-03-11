import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/data/models/request/indextPageCountRequestModel.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_indext_page_count.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../constants.dart';
import '../../data/constants/app_constants_value.dart';
import '../../data/processResponse/status.dart';
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
  IndextPageCountViewModel indextPageCountViewModel =
  IndextPageCountViewModel();

  @override
  void initState() {
    super.initState();
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
      userId: 'Delivery524',
    );

    indextPageCountViewModel.fetchIndextPageCountData(
      indexCountRequestmodel,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChangeNotifierProvider<IndextPageCountViewModel>(
              create: (BuildContext context) => indextPageCountViewModel,
              child: Consumer<IndextPageCountViewModel>(
                builder: (context, value, _) {
                  switch (value.indextPageCountData.status ?? "") {
                    case Status.LOADING:
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    case Status.ERROR:
                      return const Text(
                          "Hello i am waiting error on Home page");
                    case Status.COMPLETED:
                      return Column(
                        children: [
                          Material(
                            elevation: 4,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(24),
                              bottomLeft: Radius.circular(24),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 32),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(24),
                                  bottomLeft: Radius.circular(24),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
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
                          SizedBox(
                            height: 10,
                          ),
                          PaymentsCard(
                            TotalOrders:
                            value.indextPageCountData.data?.onlinePayment
                                .toString() ??
                                "",
                            CompleteOrders: value.indextPageCountData.data?.codPayment
                                .toString() ??
                                "",
                            PackedOrders: value.indextPageCountData.data
                                ?.deliverOrder.toString() ??
                                "",
                            TotalCODOrders: value.indextPageCountData.data
                                ?.pendingOrder.toString() ??
                                "",
                            TotalshippingOrders: value.indextPageCountData.data
                                ?.deliverOrder.toString() ??
                                "",
                            TotalReturnOrders: value.indextPageCountData.data
                                ?.cancelDeliyerorder.toString() ??
                                "",
                            TotalRejectOrders: value.indextPageCountData.data
                                ?.cancelDeliyerorder.toString() ??
                                "",
                            Deliverycancelorder: value.indextPageCountData.data
                                ?.cancelDeliyerorder.toString() ??
                                "",
                            TotalOnlineOrders: value.indextPageCountData.data
                                ?.cancelDeliyerorder.toString() ??
                                "",
                            TotalOnlinePaymentcollection: value.indextPageCountData.data
                                ?.cancelDeliyerorder.toString() ??
                                "",
                            TotalCODPaymentcollection: value.indextPageCountData.data
                                ?.cancelDeliyerorder.toString() ??
                                "",
                            TotalPendingCODPayments: value.indextPageCountData.data
                                ?.cancelDeliyerorder.toString() ??
                                "",
                          ),
                        ],
                      );
                  }
        
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
