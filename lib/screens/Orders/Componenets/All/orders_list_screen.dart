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

import '../../../../data/constants/app_constants_value.dart';
import '../select_date_and_search_date_widget.dart';

class AllWidget extends StatefulWidget {
  final String type;

  const AllWidget({Key? key, required this.type}) : super(key: key);

  @override
  State<AllWidget> createState() => _AllWidgetState();
}

class _AllWidgetState extends State<AllWidget> with WidgetsBindingObserver {
  late OrderListViewModel orderListViewModel;
  late OrderListRequestModel data;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    orderListViewModel = OrderListViewModel();
    data = OrderListRequestModel(userId: Constants.userIdForUse, type: widget.type);
    orderListViewModel.fetchOrderListData(data, context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Call the fetch data method here
      orderListViewModel.fetchOrderListData(data, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderListViewModel>(
      create: (BuildContext context) => orderListViewModel,
      child: Consumer<OrderListViewModel>(
        builder: (context, value, _) {
          Widget content;
          switch (value.orderqListData.status ?? "") {
            case Status.LOADING:
              content = Center(child: buildShimmerProductDetails());
              break;
            case Status.ERROR:
              content = Center(child: emptyAnimationWidget());
              break;
            case Status.COMPLETED:
              content = Container(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // const SelectDateAndSearchDate(),
                      // const SizedBox(height: 10),
                      OrdersItem(orderqListData: value.orderqListData, type: widget.type),
                    ],
                  ),
                ),
              );
              break;
            default:
              content = Container();
              break;
          }
          return content;
        },
      ),
    );
  }
}
