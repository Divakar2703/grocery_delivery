import 'package:flutter/material.dart';

class CODtCard extends StatefulWidget {
  const CODtCard({super.key});

  @override
  State<CODtCard> createState() => _PCardState();
}

class _PCardState extends State<CODtCard> {

  final List<Map<String, dynamic>> eventItems = [
    {
      'Sr.No': '1',
      'Order Date/Time':'28-02-2024 01:30:33 pm',
      'Collection Date/Time':'#489423r',
      'Order ID': '28-02-2024 03:36:02 pm',
      'Amount':'2024-02-28 15:53:45',
      'Customer Addresss':'2024-02-28 15:53:45',
      'Seller Id':'ORD-1~1709107233',
      'Status' : 'Shipped order'
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: eventItems.map((item) {
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: Colors.grey
              )
          ),
          child:  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sr No. :",
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
                      "Order Date/Time :",
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
                      "Collection Date/Time :",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                      maxLines: 1, // Set maximum number of lines
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Order ID :",
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
                      "Amount :",
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
                      "Customer Addresss :",
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
                      "Seller Id :",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                    ),


                    SizedBox(
                      height: 5,
                    ),





                    Text(
                      "Status :",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
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
                      item['Sr.No'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                      maxLines: 1, // Set maximum number of lines
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      item['Order Date/Time'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                      maxLines: 1, // Set maximum number of lines
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      item['Collection Date/Time'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                      maxLines: 1, // Set maximum number of lines
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      item['Order ID'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                      maxLines: 1, // Set maximum number of lines
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                        height: 3
                    ),
                    Text(
                      item['Amount'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                      maxLines: 1, // Set maximum number of lines
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      item['Customer Addresss'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                      maxLines: 1, // Set maximum number of lines
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      item['Seller Id'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                      maxLines: 1, // Set maximum number of lines
                      overflow: TextOverflow.ellipsis,
                    ),













                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue
                      ),
                      child: Text(
                        item['Status'],
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Muli",
                            color: Colors.white
                        ),
                        maxLines: 1, // Set maximum number of lines
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
