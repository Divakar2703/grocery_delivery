import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/screens/Orders/Componenets/All/item_product.dart';
import 'package:grocery_delivery_side/screens/Orders/Componenets/All/return_order_buttom_sheet.dart';
import 'package:grocery_delivery_side/style/colors.dart';
import '../../../../constants.dart';
import '../../../../data/constants/app_constants_value.dart';
import '../../../../data/models/request/acceptOrderRequestModel.dart';
import '../../../../data/models/request/cancelOrderRequestModel.dart';
import '../../../../data/models/request/rejectOrderRequestModel.dart';
import '../../../../data/models/request/returnOrderVerifyOtpRequestModel.dart';
import '../../../../data/models/response/OrderListResponseModel.dart';
import '../../../../viewmodels/view_model_order_list.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Order item;

  const OrderDetailsScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  late OrderListViewModel orderListViewModel;
  String payId='';
  String orderId='';

  @override
  void initState() {
    super.initState();
    orderListViewModel = OrderListViewModel();
    payId = widget.item.payid.toString();
    orderId = widget.item.orderID.toString();
  }

  acceptOrder(BuildContext context, String payId, Order item) {
    final data = AcceptOrderRequestModel(
        userId: Constants.userIdForUse, payId: payId);
    orderListViewModel.fetchAcceptOrderData(data, context);

    // Attempt to convert string coordinates to doubles (handle exceptions)
    try {
      orderListViewModel.sourceLat = double.parse(item.sellerLatitude ?? '0.0');
      orderListViewModel.sourceLong = double.parse(item.sellerLongitude ?? '0.0');
      orderListViewModel.destiLat = double.parse(item.customerLatitude ?? '0.0');
      orderListViewModel.destiLong = double.parse(item.customerLongitude ?? '0.0');
    } on FormatException {
      // Handle the case where parsing fails (e.g., show an error message)
      print("Error: Invalid latitude or longitude format");
    }
  }

  //when user will not there for receive order
  cancelOrder(BuildContext context, String payId, String comment,
      String orderId) {
    final data = CancelOrderRequestModel(userId: Constants.userIdForUse,
        comment: comment,
        orderId: orderId,
        payId: payId);
    orderListViewModel.fetchCancelOrderData(data, context);
  }

  //when delivery boy will not want to accept the order
  rejectOrder(BuildContext context, String payId, String comment) {
    final data = RejectOrderRequestModel(
      userId: Constants.userIdForUse, payId: payId, rejectedReason: comment,);
    orderListViewModel.fetchRejectOrderData(data, context);
  }

  //when delivery boy will return the order to the seller
  returnOrder(BuildContext context, String payId) {
    final data = AcceptOrderRequestModel(
        userId: Constants.userIdForUse, payId: payId);
    orderListViewModel.fetchReturnOrderData(data, context);
  }

  //when delivery boy will return the order to the seller and verify otp , otp will get on the seller side and fill on delivery boy side
  returnOrderVerifyOtp(BuildContext context, String payId, String comment,
      String otp) {
    final data = ReturnOrderVerifyOtpRquestModel(
      userId: Constants.userIdForUse, reason: comment, otp: otp, payId: payId,);
    orderListViewModel.fetchReturnOrderVerifyOtpData(data, context);
  }

  void showReturnOrderBottomSheet(BuildContext context, String tappedButton) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ReturnOrderBottomSheet(
            tappedButton: tappedButton, // or 'return' or 'verifyOtp'
            payId: payId,
            orderId: orderId,
            cancelOrderCallback: cancelOrder,
            rejectOrderCallback: rejectOrder,
            returnOrderCallback: returnOrder,
            returnOrderVerifyOtpCallback: returnOrderVerifyOtp
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
                        productName: widget.item.product![index].productName
                            .toString(),
                        sellerName: widget.item.product![index].sellerName
                            .toString(),
                        quantity: widget.item.product![index].productQty
                            .toString(),
                        price: widget.item.product![index].productPrice
                            .toString(),
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
                                "${widget.item.deliveredDate}",
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
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showReturnOrderBottomSheet(context,
                                "Return");
                          },
                          child: Container(
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade200),
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
                      const SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showReturnOrderBottomSheet(context,
                                "Reject");
                          },
                          child: Container(
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.purple.shade200),
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
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showReturnOrderBottomSheet(context,
                                "Cancel");
                          },
                          child: Container(
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red.shade200),
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
                      const SizedBox(
                        width: 10,
                      ),
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
                                  child:
                                  CircularProgressIndicator(), // Or any other loading indicator
                                );
                              },
                            );

                            // Perform the accept order action
                            acceptOrder(
                                context, widget.item.payid.toString(),
                                widget.item)
                                .then((_) {
                              // Dismiss the progress dialog when the action is completed
                              Navigator.pop(
                                  context); // Dismiss the progress dialog
                            });
                          },
                          child: Container(
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kPrimaryColor),
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
                    ],
                  ),
                  const SizedBox(height: 16.0,)
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
