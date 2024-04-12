import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/screens/Orders/Componenets/All/item_product.dart';
import 'package:grocery_delivery_side/screens/Orders/Componenets/All/return_order_button.dart';
import 'package:grocery_delivery_side/style/colors.dart';
import '../../../../constants.dart';
import '../../../../data/models/response/OrderListResponseModel.dart';

void openOrderDetailsBottomSheet(BuildContext context, Order item, Function(BuildContext, String,Order) acceptOrderCallback) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Set this to true

    builder: (BuildContext context) {
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
              // backgroundColor:Color(0xFFF2F8FA),
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
                      "Order ID: ${item.orderID}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500,color: AppColors.primaryColor2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${item.orderDate}",
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
                      itemCount: item.product!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemProduct(
                          productName: item.product![index].productName.toString(),
                          sellerName: item.product![index].sellerName.toString(),
                          quantity: item.product![index].productQty.toString(),
                          price: item.product![index].productPrice.toString(),
                          total: item.product![index].total.toString(),
                          image: item.product![index].image.toString(),
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
                                "${item.paymentMode}",
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
                                " ${item.type}",
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
                                  "${item.deliveredDate}",
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
                                  "${item.orderAmount}",
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
                                  "${item.sellerName}",
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
                                  "${item.sellerContactno}",
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
                                  "${item.sellerStorename}",
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
                                  "${item.pickUpAddress}",
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
                                  "${item.customerName}",
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
                                  "${item.customerContactNo}",
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
                                  "${item.customerAddress}",
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
                              openReturnOrderBottomSheet(context);
                            },
                            child: Container(
                              // padding: EdgeInsets.symmetric(horizontal: 16),
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
                          child: Container(
                            // padding: EdgeInsets.symmetric(horizontal: 16),
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
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Show progress dialog
                              showDialog(
                                context: context,
                                barrierDismissible: false, // Prevent user from dismissing the dialog
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(), // Or any other loading indicator
                                  );
                                },
                              );

                              // Perform the accept order action
                              acceptOrderCallback(context, item.payid.toString(), item).then((_) {
                                // Dismiss the progress dialog when the action is completed
                                Navigator.pop(context); // Dismiss the progress dialog
                              });
                            },

                            child: Container(
                              // padding: EdgeInsets.symmetric(horizontal: 16),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}


