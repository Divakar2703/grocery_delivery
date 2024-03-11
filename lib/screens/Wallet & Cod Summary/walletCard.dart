import 'package:flutter/material.dart';

class WalletCard extends StatefulWidget {
  const WalletCard({super.key});

  @override
  State<WalletCard> createState() => _PCardState();
}

class _PCardState extends State<WalletCard> {

  final List<Map<String, dynamic>> eventItems = [
    {
      'Sr.No': '1',
      'Date/Time':'28-02-2024 01:30:33 pm',
      'Order ID':'#489423r',
      'Description': '28-02-2024 03:36:02 pm',
      'Debit':'2024-02-28 15:53:45',
      'Credit':'2024-02-28 15:53:45',
      'Closing Balance':'ORD-1~1709107233',
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
                      "Date/Time :",
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
                      maxLines: 1, // Set maximum number of lines
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Description :",
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
                      "Debit :",
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
                      "Credit :",
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
                      "Closing Balance :",
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
                      item['Date/Time'],
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
                      height: 3,
                    ),
                    Text(
                      item['Description'],
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
                      item['Debit'],
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
                      item['Credit'],
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
                      item['Closing Balance'],
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
