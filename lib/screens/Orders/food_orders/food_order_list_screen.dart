import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/screens/Orders/food_orders/food_order_item.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_order_list_food.dart';
import 'package:provider/provider.dart';

import '../../../data/constants/app_constants_value.dart';
import '../../../data/models/request/orderListRequestModel.dart';
import '../../../data/processResponse/status.dart';
import '../../../helper/empty_animation.dart';
import '../Componenets/All/orders_item.dart';
import '../Componenets/All/simmer_order_list.dart';
import '../Componenets/select_date_and_search_date_widget.dart';

class FoodOrderListScreen extends StatefulWidget {
  final String type;
  const FoodOrderListScreen({super.key, required this.type});

  @override
  State<FoodOrderListScreen> createState() => _FoodOrderListScreenState();
}

class _FoodOrderListScreenState extends State<FoodOrderListScreen> {
  late OrderListFoodViewModel orderListViewModel;

  @override
  void initState() {
    super.initState();
    orderListViewModel = OrderListFoodViewModel();
    final data = OrderListRequestModel(userId: Constants.userIdForUse, type: widget.type);
    orderListViewModel.fetchOrderListData(data, context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderListFoodViewModel>(
      create: (BuildContext context) => orderListViewModel,
      child: Consumer<OrderListFoodViewModel>(
        builder: (context, value, _) {
          switch (value.orderqListData.status ?? "") {
            case Status.LOADING:
              return Center(child: buildShimmerProductDetails());
            case Status.ERROR:
              return Container(
                color: Colors.white,
                  child: Center(child: noFoodAnimationWidget()));
            case Status.COMPLETED:
              return Container(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FoodOrderItem(orderqListData: value.orderqListData, type: widget.type),
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
