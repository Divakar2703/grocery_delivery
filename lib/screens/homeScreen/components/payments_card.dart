import 'package:flutter/material.dart';

class PaymentsCard extends StatefulWidget {
  String TotalOrders;
  String CompleteOrders;
  String PackedOrders;
  String TotalCODOrders;
  String TotalshippingOrders;
  String TotalReturnOrders;
  String TotalRejectOrders;
  String Deliverycancelorder;
  String TotalOnlineOrders;
  String TotalOnlinePaymentcollection;
  String TotalCODPaymentcollection;
  String TotalPendingCODPayments;

  PaymentsCard({
    required this.TotalOrders,
    required this.CompleteOrders,
    required this.PackedOrders,
    required this.TotalCODOrders,
    required this.TotalshippingOrders,
    required this.TotalReturnOrders,
    required this.TotalRejectOrders,
    required this.Deliverycancelorder,
    required this.TotalOnlineOrders,
    required this.TotalOnlinePaymentcollection,
    required this.TotalCODPaymentcollection,
    required this.TotalPendingCODPayments,



    Key? key,
  }) : super(key: key);

  @override
  State<PaymentsCard> createState() => _PaymentsCardState();
}

class _PaymentsCardState extends State<PaymentsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 90,
                             //   margin: EdgeInsets.only(right: 16), // Add margin between items
                    decoration: BoxDecoration(
                     // color: Color(0xFFF87A6C),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Total\nOrders',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.TotalOrders,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 70,
                          child: Image.asset(
                            'assets/images/m.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 90,
                  //  margin: EdgeInsets.only(right: 16), // Add margin between items
                    decoration: BoxDecoration(
                   //   color: Color(0xFFF87A6C),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Complete\nOrders',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.CompleteOrders,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 70,
                          child: Image.asset(
                            'assets/images/m1.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 90,
                    //   margin: EdgeInsets.only(right: 16), // Add margin between items
                    decoration: BoxDecoration(
                      // color: Color(0xFFF87A6C),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Packed\nOrders',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.PackedOrders,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 70,
                          child: Image.asset(
                            'assets/images/cc.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 90,
                    //  margin: EdgeInsets.only(right: 16), // Add margin between items
                    decoration: BoxDecoration(
                      //   color: Color(0xFFF87A6C),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Total COD\nOrders',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.TotalCODOrders,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 70,
                          child: Image.asset(
                            'assets/images/p.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 100,
                    //   margin: EdgeInsets.only(right: 16), // Add margin between items
                    decoration: BoxDecoration(
                      // color: Color(0xFFF87A6C),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Total\nshipping\nOrders',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.TotalshippingOrders,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 70,
                          child: Image.asset(
                            'assets/images/k.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 100,
                    //  margin: EdgeInsets.only(right: 16), // Add margin between items
                    decoration: BoxDecoration(
                      //   color: Color(0xFFF87A6C),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Total\nReturn\nOrders',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.TotalReturnOrders,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 70,
                          child: Image.asset(
                            'assets/images/c.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),


          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 100,
                    //   margin: EdgeInsets.only(right: 16), // Add margin between items
                    decoration: BoxDecoration(
                      // color: Color(0xFFF87A6C),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Total\nReject\nOrders',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.TotalRejectOrders,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 70,
                          child: Image.asset(
                            'assets/images/k.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 100,
                    //  margin: EdgeInsets.only(right: 16), // Add margin between items
                    decoration: BoxDecoration(
                      //   color: Color(0xFFF87A6C),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Delivery\ncancel\norder',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.Deliverycancelorder,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 70,
                          child: Image.asset(
                            'assets/images/c.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 115,
                    //  margin: EdgeInsets.only(right: 16), // Add margin between items
                    decoration: BoxDecoration(
                      //   color: Color(0xFFF87A6C),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Total\nOnline\nOrders',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.TotalOnlineOrders,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 70,
                          child: Image.asset(
                            'assets/images/c.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 115,
                    //   margin: EdgeInsets.only(right: 16), // Add margin between items
                    decoration: BoxDecoration(
                      // color: Color(0xFFF87A6C),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Total\nOnline\nPayment\ncollection',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.TotalOnlinePaymentcollection,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 70,
                          child: Image.asset(
                            'assets/images/k.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 115,
                    //  margin: EdgeInsets.only(right: 16), // Add margin between items
                    decoration: BoxDecoration(
                      //   color: Color(0xFFF87A6C),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Total\nCOD\nPayment\ncollection',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.TotalCODPaymentcollection,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 70,
                          child: Image.asset(
                            'assets/images/c.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 115,
                    //   margin: EdgeInsets.only(right: 16), // Add margin between items
                    decoration: BoxDecoration(
                      // color: Color(0xFFF87A6C),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Total\nPending\nCOD\nPayments',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.TotalPendingCODPayments,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 70,
                          child: Image.asset(
                            'assets/images/k.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),

        ],
      ),
    );
  }
}
