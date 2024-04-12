import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/data/models/request/acceptOrderRequestModel.dart';
import 'package:grocery_delivery_side/screens/Orders/Componenets/All/simmer_order_list.dart';
import 'package:provider/provider.dart';
import 'package:grocery_delivery_side/screens/Orders/Componenets/All/orders_item.dart';
import 'package:grocery_delivery_side/data/models/request/orderListRequestModel.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_order_list.dart';
import 'package:grocery_delivery_side/helper/empty_animation.dart';
import 'package:grocery_delivery_side/constants.dart';
import 'package:grocery_delivery_side/data/processResponse/status.dart';

import '../select_date_and_search_date_widget.dart';

class AllWidget extends StatefulWidget {
  final String type;

  const AllWidget({Key? key, required this.type}) : super(key: key);

  @override
  State<AllWidget> createState() => _AllWidgetState();
}

class _AllWidgetState extends State<AllWidget> {
  late OrderListViewModel orderListViewModel;

  @override
  void initState() {
    super.initState();
    orderListViewModel = OrderListViewModel();
    final data = OrderListRequestModel(userId: "Delivery104", type: widget.type);
    orderListViewModel.fetchOrderListData(data, context);
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderListViewModel>(
      create: (BuildContext context) => orderListViewModel,
      child: Consumer<OrderListViewModel>(
        builder: (context, value, _) {
          switch (value.orderqListData.status ?? "") {
            case Status.LOADING:
              return Expanded(child: Center(child: buildShimmerProductDetails()));
            case Status.ERROR:
              return Expanded(child: Center(child: emptyAnimationWidget()));
            case Status.COMPLETED:
              return Container(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
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
                            SelectDateAndSearchDate(),
                            SizedBox(height: 5),
                            SizedBox(height: 5),
                            Divider(
                              thickness: 1,
                            ),
                            SizedBox(height: 10),
                            OrdersItem(orderqListData: value.orderqListData),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
          }
          return Container();
        },
      ),
    );
  }
}
