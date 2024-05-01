import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grocery_delivery_side/data/models/request/updateLocationResModel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../data/constants/app_constants_value.dart';
import '../../data/models/request/indextPageCountRequestModel.dart';
import '../../data/models/request/updateLocationReqModel.dart';
import '../../data/processResponse/status.dart';
import '../../helper/empty_animation.dart';
import '../../viewmodels/view_model_indext_page_count.dart';
import '../Orders/Componenets/All/simmer_order_list.dart';
import 'components/payments_card.dart';
import 'package:location/location.dart' as loc;



class GroceryHome extends StatefulWidget {
  const GroceryHome({super.key});

  @override
  State<GroceryHome> createState() => _GroceryHomeState();
}

class _GroceryHomeState extends State<GroceryHome> {
  late IndextPageCountViewModel indextPageCountViewModel;
  loc.LocationData? locationData;
  List<Placemark>? placemark;
  bool _isLoading = false;


  @override
  void initState() {
    super.initState();
    indextPageCountViewModel = IndextPageCountViewModel();
    askLocationPermission();
    // getHomePageData();
  }

  void askLocationPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      getHomePageData();
      getLocation();
    } else {
      getHomePageData();
      // getLocation();

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


  void getLocation() async {
    setState(() {
      _isLoading = true;
    });
    locationData = await loc.Location.instance.getLocation();
    if (locationData != null) {
      getAddressUpdateLocation();
    }
  }

  void getAddressUpdateLocation() async {
    placemark = await placemarkFromCoordinates(
      locationData!.latitude!,
      locationData!.longitude!,
    );

    if (placemark != null && placemark!.isNotEmpty) {
      final updateLocationReqModel = UpdateLocationReqModel(
          userId: Constants.userIdForUse,
          latitude: locationData!.latitude!.toString(),
          longitude: locationData!.longitude!.toString(),

      );

      indextPageCountViewModel.fetchUpdatedLocationData(
        updateLocationReqModel,
        context,
      );
    }
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
