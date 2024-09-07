import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/SubmitOrdCollReq.dart';
import 'package:grocery_delivery_side/phonepeGateway/PhonePeGatewayWebview.dart';
import 'package:grocery_delivery_side/screens/Orders/Componenets/PaymentModeDialog.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_order_list_food.dart';
import '../../../constants.dart';
import '../../../data/constants/app_constants_value.dart';
import '../../../data/models/request/acceptOrderRequestModel.dart';
import '../../../data/models/request/cancelOrderRequestModel.dart';
import '../../../data/models/request/deliverOrderVerifyOtpRequestModel.dart';
import '../../../data/models/request/orderListRequestModel.dart';
import '../../../data/models/request/rejectOrderRequestModel.dart';
import '../../../data/models/request/returnOrderVerifyOtpRequestModel.dart';
import '../../../data/models/response/OrderListResponseModel.dart';
import '../../../data/processResponse/status.dart';
import '../../../helper/toast.dart';
import '../../../style/colors.dart';
import '../../map/food_map_tracking.dart';
import '../Componenets/All/deliver_verify_Otp.dart';
import '../Componenets/All/item_product.dart';
import '../Componenets/All/return_order_buttom_sheet.dart';
import 'food_order_list_tab_screen.dart';

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
  String selectedPayModeVal = '';
  late TextEditingController onlinePriceController;

  @override
  void initState() {
    super.initState();
    orderListViewModel = OrderListFoodViewModel();
    payId = widget.item.payid.toString();
    orderId = widget.item.orderID.toString();

    onlinePriceController = TextEditingController();
    onlinePriceController.text = widget.item.orderAmount.toString();

    print('tab type: ${widget.item.type}');

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

  void showSplitPayDialog(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: true,
      // Prevent user from dismissing the dialog
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(
                  'Total Payable Amount',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontFamily: "Muli",
                  ),
                ),

                SizedBox(height: 16),

                TextField(
                  controller: onlinePriceController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    hintText: 'Online Amount',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    // errorText: nameError,
                  ),
                ),

                SizedBox(height: 16),

                GestureDetector(
                  onTap: () {

                    var enterAmount = 0;
                    var orderAmount = 0;

                    setState(() {

                      if(onlinePriceController.text.toString().isNotEmpty){
                        enterAmount = int.parse(onlinePriceController.text.toString());
                        orderAmount = int.parse(widget.item.orderAmount!);

                        if(enterAmount!=0 && enterAmount<=orderAmount){
                          Navigator.of(context).pop();
                          initiatePayment(enterAmount);
                        }else{
                          AppToast.showToast('Amount should be less and equal to order amount');
                        }

                      }else{
                        AppToast.showToast('Enter amount should not be empty');
                      }


                    });

                  },
                  child: Container(
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.shade200,
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "Muli",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

  }

  Future<void> submitOrdColl(String onlineAmt,String offlineAmt) async {

    var data = SubmitOrdCollReq(
      ordId: orderId,
      onlineAmt: onlineAmt,
      offlineAmt: offlineAmt,
      collectMode: selectedPayModeVal
    );

   await orderListViewModel.submitOrdCollType(data, context);

   setState(() {
     // Check the API response after it's been updated
     if (orderListViewModel.getOrdCollResData.status == Status.COMPLETED) {
       print('submitOrdCall Success ${orderListViewModel.getOrdCollResData}');
       AppToast.showToast(orderListViewModel.getOrdCollResData.data?.message ?? "Order Completed");

     } else if (orderListViewModel.getOrdCollResData.status == Status.ERROR) {
       print('submitOrdCall failed ${orderListViewModel.getOrdCollResData}');
       AppToast.showToast(orderListViewModel.getOrdCollResData.message ?? "Order failed");
     }

   });

  }

  void initiatePayment(int amount) async {
    print('init payment :>> $amount');
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhonePeGatewayWebView(
          orderId: orderId,
          txnAmount: amount,
        ),
      ),
    );

    print("payResult>> $result");

    if (result != null) {
      // Handle the result here
      setState(() {
        if (result['success']) {
          AppToast.showToast("Payment Successful");

          num ordAmt = num.parse(widget.item.orderAmount!);
          num onlineAmt = result['amount'] / 100;
          num offlineAmount = ordAmt - onlineAmt;

          print('values of amount:-  $ordAmt  $onlineAmt $offlineAmount');

          submitOrdColl(onlineAmt.toString(),offlineAmount.toString());
        } else {
          print("Payment Failed: ${result['message']}");
          AppToast.showToast("Payment Failed: ${result['message']}");
        }
      });
    }else{
      AppToast.showToast("Error in getting payment result");
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
    final data = AcceptOrderRequestModel(userId: Constants.userIdForUse, payId: payId);
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
    return MaterialApp(
      home: Container(
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
                          Column(
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

                              if(widget.item.type=="Delivered" && widget.item.paymentMode!="wallet" && widget.item.paymentMode != "phonepe" && widget.item.paymentMode!="online"&&widget.item.paymentMode!="razorpay") Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Collection Mode :",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Muli",
                                    ),
                                  ),
                                  Text(
                                    "Online Collection :",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Muli",
                                    ),
                                  ),
                                  Text(
                                    "Offline Collection :",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Muli",
                                    ),
                                  ),
                                ],
                              )
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

                              if(widget.item.type=="Delivered" && widget.item.paymentMode!="wallet" && widget.item.paymentMode != "phonepe" && widget.item.paymentMode!="online"&&widget.item.paymentMode!="razorpay") Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.item.collectionMode}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Muli",
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  Text(
                                    "Rs. ${widget.item.onlineCollect}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Muli",
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  Text(
                                    "Rs. ${widget.item.offlineCollect}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Muli",
                                      color: kPrimaryColor,
                                    ),
                                  )
                                ],
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
                                  "Rs. "
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
                                // showDeliverOtpVerifyBottomSheet(context);
                                // deliveryOrderVerifyOtp(payId, "");
                                // goBack(context);

                                if(widget.item.paymentMode=="COD"){
                                  showDialog(
                                    context: context,
                                    builder: (context) => PaymentModeDialog(
                                        onConfirm: (selectedValue) {
                                          selectedPayModeVal = selectedValue;
                                          Future.microtask(() {
                                            setState(() {
                                              print('Selected value: $selectedPayModeVal');
                                              switch (selectedPayModeVal) {
                                                case "Offline":
                                                  submitOrdColl('0', widget.item.orderAmount!);
                                                  break;
                                                case "Online":
                                                  initiatePayment(int.parse(widget.item.orderAmount!));
                                                  break;
                                                // case "Both":
                                                //   showSplitPayDialog(context);
                                                //   break;
                                                default:
                                                  showSplitPayDialog(context);
                                                  break;
                                              }
                                            });
                                          });
                                        }

                                    ),
                                  );
                                }else{
                                  deliveryOrderVerifyOtp(payId, "");
                                }

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
      ),
    );
  }
}