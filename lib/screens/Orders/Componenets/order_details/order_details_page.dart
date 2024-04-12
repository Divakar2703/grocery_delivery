// import 'package:flutter/material.dart';
//
// class OrderDetails extends StatefulWidget {
//   const OrderDetails({super.key});
//
//   @override
//   State<OrderDetails> createState() => _OrderDetailsState();
// }
//
// class _OrderDetailsState extends State<OrderDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8.0),
//         child: Column(
//           children: [
//             Card(
//               elevation: 4,
//               child: Container(
//                 padding: EdgeInsets.all(8),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.green.shade100,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Card(
//                 elevation: 5,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Row(
//                         children: [
//                           Text(
//                             '${value.orderDetailsData.data?.productOrder?.length} Items in this Order',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       child: ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: 3,
//                         itemBuilder: (context, index) {
//                           return OrderProductListItem(
//                             productname: value.orderDetailsData.data?.productOrder?[index].productName,
//                             image: value.orderDetailsData.data?.productOrder?[index].image,
//                             discount: value.orderDetailsData.data?.productOrder?[index].discount,
//                             qty: value.orderDetailsData.data?.productOrder?[index].productQty,
//                             dicountedPrice: value.orderDetailsData.data?.productOrder?[index].discountedPrice,
//                             totalPrice: value.orderDetailsData.data?.productOrder?[index].total.toString(),
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: 8,
//                     ),
//                   ],
//                 )),
//             SizedBox(
//               height: 8,
//             ),
//             Card(
//               elevation: 4,
//               child: Container(
//                 padding: EdgeInsets.all(16),
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           'Bill  Details',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     HorizontalDashedDivider(),
//                     SizedBox(
//                       height: 12,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Order Id',
//                           style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.primaryColor),
//                         ),
//                         Text(
//                           '${value.orderDetailsData.data?.orderId}',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Item total (incl. taxes)',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         Text(
//                           '₹${value.orderDetailsData.data?.preamount}',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Product Discount',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.blue,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         Text(
//                           '-₹${value.orderDetailsData.data?.couponDiscount}',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.blue,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Convinience Charge',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         Text(
//                           '+₹${value.orderDetailsData.data?.convCharge}',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Delivery Charge',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         Text(
//                           '+₹${value.orderDetailsData.data?.delevaryCharge}',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Bill total',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Text(
//                           '₹${value.orderDetailsData.data?.amount}',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//             Card(
//               elevation: 4,
//               child: Container(
//                 padding: EdgeInsets.all(8),
//                 width: double.infinity,
//                 decoration: BoxDecoration(color: Colors.white70),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Icon(
//                       Icons.add_home_work_rounded,
//                       color: Colors.orange,
//                       size: 30,
//                     ),
//                     SizedBox(
//                       width: 8,
//                     ),
//                     Expanded( // Wrap the Column with Expanded
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Shipping Address",
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 2.0,
//                           ),
//                           Text(
//                             "${value.orderDetailsData.data?.address}",
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => DeliveryLocTracking()),
//                 );
//               },
//               child: Container(
//                 margin: EdgeInsets.all(16),
//                 padding: EdgeInsets.all(6),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Your Order has Shipped",
//                       style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Text(
//                       'Track Your Order',
//                       style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
