import 'package:flutter/material.dart';

class ItemProduct extends StatelessWidget {
  final String productName;
  final String sellerName;
  final String quantity;
  final String price;
  final String total;
  final String image;

  ItemProduct({
    required this.productName,
    required this.sellerName,
    required this.quantity,
    required this.price,
    required this.total,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(16),
            elevation: 4,
            child: Container(
              height: 100,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.red,
              ),
              child: Image.network(
                '$image',
                fit: BoxFit.cover, // Adjust the BoxFit property as needed
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Name :",
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
                    "Seller Name : ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Muli",
                    ),
                  ),
                  Text(
                    "Quantity : ",
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
                    "Price : Rs. ",
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
                    "Total : Rs. ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Muli",
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$productName",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "$sellerName",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                  Text(
                    "$quantity",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Rs. $price",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Rs. $total",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
