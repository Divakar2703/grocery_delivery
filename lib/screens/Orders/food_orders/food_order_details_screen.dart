import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_order_list_food.dart';

import '../../../constants.dart';
import '../../../data/constants/app_constants_value.dart';
import '../../../data/models/request/acceptOrderRequestModel.dart';
import '../../../data/models/request/cancelOrderRequestModel.dart';
import '../../../data/models/request/deliverOrderVerifyOtpRequestModel.dart';
import '../../../data/models/request/rejectOrderRequestModel.dart';
import '../../../data/models/request/returnOrderVerifyOtpRequestModel.dart';
import '../../../data/models/response/OrderListResponseModel.dart';
import '../../../style/colors.dart';
import '../../map/food_map_tracking.dart';
import '../Componenets/All/deliver_verify_Otp.dart';
import '../Componenets/All/item_product.dart';
import '../Componenets/All/return_order_buttom_sheet.dart';

class FoodOrderDetailsScreen extends StatefulWidget {
  final Order item;

  const FoodOrderDetailsScreen({
    Key? key,
    required this.item,
    required String type,
  }) : super(key: key);

  @override
  State<FoodOrderDetailsScreen> createState() => _FoodOrderDetailsScreenState();
}

class _FoodOrderDetailsScreenState extends State<FoodOrderDetailsScreen> {
  late OrderListFoodViewModel orderListViewModel;
  String payId = '';
  String orderId = '';

  @override
  void initState() {
    super.initState();
    orderListViewModel = OrderListFoodViewModel();
    payId = widget.item.payid.toString();
    orderId = widget.item.orderID.toString();

    try {
      orderListViewModel.sourceLat =
          double.parse(widget.item.sellerLatitude ?? '0.0');
      orderListViewModel.sourceLong =
          double.parse(widget.item.sellerLongitude ?? '0.0');
      orderListViewModel.destiLat =
          double.parse(widget.item.customerLatitude ?? '0.0');
      orderListViewModel.destiLong =
          double.parse(widget.item.customerLongitude ?? '0.0');
    } on FormatException {
      // Handle the case where parsing fails (e.g., show an error message)
      print("Error: Invalid latitude or longitude format");
    }
  }

  acceptOrder(BuildContext context, String payId, Order item) {
    final data =
        AcceptOrderRequestModel(userId: Constants.userIdForUse, payId: payId);
    orderListViewModel.fetchAcceptOrderData(data, context);

    // Attempt to convert string coordinates to doubles (handle exceptions)
  }

  //when user will not there for receive order
  cancelOrder(
    String comment,
    String orderId,
    String payId,
  ) {
    final data = CancelOrderRequestModel(
        userId: Constants.userIdForUse,
        comment: comment,
        orderId: orderId,
        payId: payId);
    orderListViewModel.fetchCancelOrderData(data, context);
  }

  //when delivery boy will not want to accept the order
  rejectOrder(String payId, String comment) {
    final data = RejectOrderRequestModel(
      userId: Constants.userIdForUse,
      payId: payId,
      rejectedReason: comment,
    );
    orderListViewModel.fetchRejectOrderData(data, context);
  }

  //when delivery boy will return the order to the seller
  returnOrder(String payId) {
    final data =
        AcceptOrderRequestModel(userId: Constants.userIdForUse, payId: payId);
    orderListViewModel.fetchReturnOrderData(data, context);
  }

  //when delivery boy will return the order to the seller and verify otp , otp will get on the seller side and fill on delivery boy side
  returnOrderVerifyOtp(String payId, String comment, String otp) {
    final data = ReturnOrderVerifyOtpRquestModel(
      userId: Constants.userIdForUse,
      reason: comment,
      otp: otp,
      payId: payId,
    );
    orderListViewModel.fetchReturnOrderVerifyOtpData(data, context);
  }

  //when delivery boy will return the order to the seller
  deliverOrder(String payId) {
    final data =
        AcceptOrderRequestModel(userId: Constants.userIdForUse, payId: payId);
    orderListViewModel.fetchdeliverOrderData(data, context);
  }

  //when delivery boy will return the order to the seller and verify otp , otp will get on the seller side and fill on delivery boy side
  deliveryOrderVerifyOtp(String payId, String otp) {
    final data = DeliverOrderVerifyOtpRequestModel(
      userId: Constants.userIdForUse,
      otp: otp,
      payId: payId,
    );
    orderListViewModel.fetchDeliverOrderVerifyOtpData(data, context);
  }

  void showReturnOrderBottomSheet(BuildContext context, String tappedButton) {
    final returnOrderBottomSheet = ReturnOrderBottomSheet(
      tappedButton: tappedButton,
      // or 'return' or 'verifyOtp'
      payId: payId,
      orderId: orderId,
      cancelOrderCallback: cancelOrder,
      rejectOrderCallback: rejectOrder,
      returnOrderCallback: returnOrder,
      returnOrderVerifyOtpCallback: returnOrderVerifyOtp,
      deliverOrderCallback: deliverOrder,
      deliverOrderVerifyOtpCallback: deliveryOrderVerifyOtp,
    );

    Navigator.of(context).push(_createRoute(returnOrderBottomSheet));
  }

  void showDeliverOtpVerifyBottomSheet(BuildContext context) {
    final deliverOtpVerification = DeliverOtpVerification(
      payId: payId,
      orderId: orderId,
      deliverOrderVerifyOtpCallback: deliveryOrderVerifyOtp,
    );

    Navigator.of(context).push(_createRoute(deliverOtpVerification));
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
        child: Scaffold(
          backgroundColor: const Color(0xFFFAFBFB),
          appBar: AppBar(
            elevation: 4.0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.grey,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            title: const Text(
              "Orders",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    "Order ID: ${widget.item.orderID}",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.item.orderDate}",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.item.product!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemProduct(
                        productName:
                            widget.item.product![index].productName.toString(),
                        sellerName:
                            widget.item.product![index].sellerName.toString(),
                        quantity:
                            widget.item.product![index].productQty.toString(),
                        price:
                            widget.item.product![index].netPrice.toString(),
                        total: widget.item.product![index].total.toString(),
                        image: widget.item.product![index].image.toString(),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Method of Payment :",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Muli",
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Type :",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.item.paymentMode}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Muli",
                                color: kPrimaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "${widget.item.type}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Muli",
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Customer Delivery slot :",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Muli",
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Order Amount :",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Muli",
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Seller Name :",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Muli",
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Seller Phone Number :",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Muli",
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Store Name :",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Muli",
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Pickup Address :",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Muli",
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "User Name :",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Muli",
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "User Phone Number :",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Muli",
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "User Address :",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Muli",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.item.customerDeliverySlot}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${widget.item.orderAmount}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${widget.item.sellerName}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${widget.item.sellerContactno}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${widget.item.sellerStorename}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${widget.item.pickUpAddress}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${widget.item.customerName}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${widget.item.customerContactNo}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${widget.item.customerAddress}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      if (widget.item.type == "Requested Orders")
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showReturnOrderBottomSheet(context, "Reject");
                            },
                            child: Container(
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.purple.shade200,
                              ),
                              child: const Text(
                                'Reject',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: "Muli",
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (widget.item.type == "Requested Orders")
                        const SizedBox(width: 10),
                      if (widget.item.type == "Requested Orders")
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Show progress dialog
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                // Prevent user from dismissing the dialog
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );

                              // Perform the accept order action
                              acceptOrder(context, widget.item.payid.toString(),
                                      widget.item)
                                  .then((_) {
                                // Dismiss the progress dialog when the action is completed
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kPrimaryColor,
                              ),
                              child: const Text(
                                'Accept',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: "Muli",
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (widget.item.type == "Assign Orders")
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showReturnOrderBottomSheet(context, "Cancel");
                            },
                            child: Container(
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red.shade200,
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: "Muli",
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (widget.item.type == "Assign Orders")
                        const SizedBox(width: 10),
                      if (widget.item.type == "Assign Orders")
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showReturnOrderBottomSheet(context, "Return");
                            },
                            child: Container(
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade200,
                              ),
                              child: const Text(
                                'Return',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: "Muli",
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (widget.item.type == "Assign Orders")
                        const SizedBox(width: 10),
                      if (widget.item.type == "Assign Orders")
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // deliverOrder(payId);
                              // Dismiss the progress dialog when the action is completed
                              showDeliverOtpVerifyBottomSheet(context);
                            },
                            child: Container(
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green.shade200,
                              ),
                              child: const Text(
                                'Deliver',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: "Muli",
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (widget.item.type == "Assign Orders")
                        const SizedBox(width: 10),
                      if (widget.item.type == "Assign Orders")
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodDeliveryTracking(
                                          sourceLat:
                                              orderListViewModel.sourceLat,
                                          sourceLong:
                                              orderListViewModel.sourceLong,
                                          destiLat: orderListViewModel.destiLat,
                                          destiLong:
                                              orderListViewModel.destiLong,
                                          orderId: orderId,
                                      userContactNo: widget.item!.customerContactNo.toString(),

                                    )),
                              );
                            },
                            child: Container(
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange.shade200,
                              ),
                              child: const Text(
                                'Track',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: "Muli",
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
