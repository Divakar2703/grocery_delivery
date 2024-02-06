import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/data/models/request/indextPageCountRequestModel.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_indext_page_count.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../data/processResponse/status.dart';
import 'components/home_header.dart';
import 'components/order_card.dart';
import 'components/payments_card.dart';
import 'components/search_field.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IndextPageCountViewModel indextPageCountViewModel = IndextPageCountViewModel();

  @override
  void initState() {
    getHomePageData();
    super.initState();
  }


  void getHomePageData() {
    final indexCountRequestmodel = IndextPageCountRequestModel(
      userId: "Delivery524",
    );

    indextPageCountViewModel.fetchIndextPageCountData(indexCountRequestmodel,context,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ChangeNotifierProvider<IndextPageCountViewModel>(
          create: (BuildContext context) => indextPageCountViewModel,
          child: Consumer<IndextPageCountViewModel>(builder: (context, value, _) {
            switch (value.indextPageCountData.status ?? "") {
              case Status.LOADING:
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              case Status.ERROR:
                return const Text("Hello i am waiting error on Home page");
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
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 32),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2), // Shadow color
                              spreadRadius: 2, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: Offset(0, 3), // Changes position of shadow
                            ),
                          ],
                        ),
                        child: const Column(
                          children: [
                            SizedBox(height: 15,),
                            HomeHeader(),
                            SizedBox(height: 15,),
                            SearchField(),
                          ],
                        ),

                      ),
                    ),
                    SizedBox(height: 10,),

                    PaymentsCard(
                      onlinePayment: value.indextPageCountData.data?.onlinePayment.toString() ?? "", // Assuming onlinePayment is a String
                      cod: value.indextPageCountData.data?.codPayment.toString() ?? "", // Assuming codPayment is a String
                      completed: value.indextPageCountData.data?.deliverOrder.toString() ?? "", // Assuming deliverOrder is a String
                      pending: value.indextPageCountData.data?.pendingOrder.toString() ?? "", // Assuming pendingOrder is a String
                      total: value.indextPageCountData.data?.deliverOrder.toString() ?? "", // Assuming deliverOrder is a String
                      cancel: value.indextPageCountData.data?.cancelDeliyerorder.toString() ?? "", // Assuming cancelDeliyerorder is a String
                    ),

                    //  OrderCard(),


                  ],
                );
            }

            return Container();
          }),
        ),
      ]),
    );
  }
}
