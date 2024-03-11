import 'package:flutter/material.dart';

class ReturnCard extends StatefulWidget {
  const ReturnCard({super.key});

  @override
  State<ReturnCard> createState() => _PCardState();
}

class _PCardState extends State<ReturnCard> {

  final List<Map<String, dynamic>> eventItems = [
    {
      'Sr.No': '1',
      'Order Date':'28-02-2024 01:30:33 pm',
      'Delivered Date':'2024-02-28 15:53:45',
      'Shipping Date': '28-02-2024 03:36:02 pm',
      'Return Date':'2024-02-28 15:53:45',
      'Reject Date':'2024-02-28 15:53:45',
      'Order ID':'ORD-1~1709107233',
      'Customer Name': 'pallavi Auchat',
      'Customer Address':'wardha dsgfdfg Wardha Wardha442001',
      'Customer Contact no':'9856356985	',
      'Seller Name': 'Pallavi Mengharem',
      'Seller Contactno':'8545454515',
      'Pick Up Address':'Wardha Wardha 442001',
      'Seller Storename':'vidharbha chamical',
      'Payment Mode': 'COD',
      'Order Amount':'94',
      'status' : 'Return order'
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
                      "Order Date :",
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
                      "Delivered Date :",
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
                      "Shipping Date :",
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
                      "Return Date :",
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
                      "Reject Date :",
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




                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Customer Name :",
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
                      "Customer Address :",
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
                      "Customer Contact no :",
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
                      "Seller Name :",
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
                      "Seller Contactno :",
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
                      "Pick Up Address :",
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
                      "Seller Storename :",
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
                      "Payment Mode :",
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
                      "Order Amount :",
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
                      item['Order Date'],
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
                      item['Delivered Date'],
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
                      item['Shipping Date'],
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
                      item['Return Date'],
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
                      item['Reject Date'],
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
                      item['Customer Name'],
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
                      item['Customer Address'],
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
                      item['Customer Contact no'],
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
                      item['Seller Name'],
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
                      item['Seller Contactno'],
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
                      item['Pick Up Address'],
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
                      item['Seller Storename'],
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
                      item['Payment Mode'],
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
                      item['Order Amount'],
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
                        item['status'],
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
