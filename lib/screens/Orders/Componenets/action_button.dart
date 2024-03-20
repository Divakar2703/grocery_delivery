  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:grocery_delivery_side/screens/Orders/Componenets/return_order_button.dart';
  
  import '../../../constants.dart';
  
  void openActionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set this to true
  
      builder: (BuildContext context) {
        return Container(
          height: 550,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
            child: Scaffold(
              backgroundColor: Color(0xFFFAFBFB),
              appBar: AppBar(
                // backgroundColor:Color(0xFFF2F8FA),
                elevation: 4.0,
                centerTitle: true,
                automaticallyImplyLeading: false,
  
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                title: Text(
                  "Orders",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Order ID - ORD-43~348792349",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "19-02-2024 3:43 pm",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
  
  
  
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey
                          ),
                          borderRadius: BorderRadius.circular(12)
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
                                child: Image.asset(
                                  'assets/images/ap.jpeg',
                                  fit: BoxFit.cover, // Adjust the BoxFit property as needed
                                ),
                              ),
                            ),
                             SizedBox(height: 10,),
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
                                        "Seller Name :",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Muli",
                                        ),
                                      ),
                                      Text(
                                        "Quantity :",
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
                                        "Price :",
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
                                        "Total :",
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
                                        "Tomato",
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
                                        "Akshay Satpute",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Muli",
                                        ),
                                      ),
                                      Text(
                                        "02",
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
                                        "Rs. 50.00",
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
                                        "Rs. 50.00",
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
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(12)
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
                                child: Image.asset(
                                  'assets/images/ap.jpeg',
                                  fit: BoxFit.cover, // Adjust the BoxFit property as needed
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
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
                                      "Seller Name :",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Muli",
                                      ),
                                    ),
                                    Text(
                                      "Quantity :",
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
                                      "Price :",
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
                                      "Total :",
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
                                      "Tomato",
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
                                      "Akshay Satpute",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Muli",
                                      ),
                                    ),
                                    Text(
                                      "02",
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
                                      "Rs. 50.00",
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
                                      "Rs. 50.00",
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
                      ),
  
  
                  
                      Divider(
                        thickness: 1,
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
                                  "Status :",
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
                                  "COD",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Muli",
                                    color: kPrimaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "request order",
                                  style: TextStyle(
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
                  
                      Divider(
                        thickness: 1,
                      ),
                  
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
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
                                    "Delivery Charges :",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Muli",
                                    ),
                                  ),
                                  Text(
                                    "Order Price :",
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
                  
                              SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "2024-02-19 (07:00 AM - 10:00 AM )",
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
                                    "Rs 30.00",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Muli",
                                    ),
                                  ),
                                  Text(
                                    "Rs 30.00",
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
                                    "Pallavi Auchat",
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
                                    "7894561230",
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
                                    "nsb colony wardha Wardha Maharashtra India 442001",
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
                        ),
                      ),
  
                      Divider(
                        thickness: 1,
                      ),
  
  
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                openReturnOrderBottomSheet(context);
                              },
                              child: Container(
                               // padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue
                                ),
                                child:  Text('Return',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontFamily: "Muli",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              // padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red
                              ),
                              child:  Text('Cancel',
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