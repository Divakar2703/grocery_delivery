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
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                    children: [

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeCardView(cardTitle: "Total\nOrders", cardCount: value.indextPageCountData.data?.totalOrders.toString() ??"", cardImage: "assets/images/m.png"),
              const SizedBox(width: 10),
              HomeCardView(cardTitle: "Complete\nOrders", cardCount: value.indextPageCountData.data?.completeOrders.toString() ??"", cardImage: "assets/images/m1.png")
            
            ],
          ),
          const SizedBox(height: 16),
                      Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeCardView(cardTitle: "Packed\nOrders", cardCount: value.indextPageCountData.data?.packedOrders.toString() ??"", cardImage: "assets/images/cc.png"),
              const SizedBox(width: 10),
              HomeCardView(cardTitle: "Total COD\nOrders", cardCount: value.indextPageCountData.data?.totalCODOrders.toString() ??"", cardImage: "assets/images/p.png")
            
            ],
          ),
                    const SizedBox(height: 16),
                      Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeCardView(cardTitle: "Total\nshipping\nOrderss", cardCount: value.indextPageCountData.data?.totalShippingOrders.toString() ??"", cardImage: "assets/images/k.png"),
              const SizedBox(width: 10),
              HomeCardView(cardTitle: "Total\nReturn\nOrders", cardCount: value.indextPageCountData.data?.totalReturnOrders.toString() ??"", cardImage: "assets/images/c.png")
            
            ],
          ),
                              const SizedBox(height: 16),
                      Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeCardView(cardTitle: "Reject\nOrders", cardCount: value.indextPageCountData.data?.totalRejectOrders.toString() ??"", cardImage: "assets/images/k.png"),
              const SizedBox(width: 10),
              HomeCardView(cardTitle: "Delivery\ncancel\norder", cardCount: value.indextPageCountData.data?.deliveryCancelOrder.toString() ??"", cardImage: "assets/images/c.png")
            
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeCardView(cardTitle: "Online\nOrders", cardCount: value.indextPageCountData.data?.totalOnlineOrders.toString() ??"", cardImage: "assets/images/c.png"),
              const SizedBox(width: 10),
              HomeCardView(cardTitle: "Online\nPayment\ncollection", cardCount: value.indextPageCountData.data?.totalOnlinePaymentCollection.toString() ??"", cardImage: "assets/images/k.png")
            
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeCardView(cardTitle: "COD\nPayment\ncollection", cardCount: value.indextPageCountData.data?.totalCODPaymentCollection.toString() ??"", cardImage: "assets/images/c.png"),
              const SizedBox(width: 10),
              HomeCardView(cardTitle: "Pending\nCOD\nPayments", cardCount: value.indextPageCountData.data?.totalPendingCODPayments.toString() ??"", cardImage: "assets/images/k.png")
            
            ],
          ),
                      ],
                  ),
                  )
                );
            }

            return const SizedBox(); // Return an empty SizedBox if status is not loading or completed.
          },
        ),
      ),
    );
  }
}
