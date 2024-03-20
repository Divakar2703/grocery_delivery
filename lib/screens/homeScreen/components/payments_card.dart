import 'package:flutter/material.dart';

import '../../map/delivery_loc_tracking.dart';

class PaymentsCard extends StatefulWidget {
  String onlinePayment;
  String cod;
  String completed;
  String pending;
  String total;
  String cancel;

  PaymentsCard({
    required this.onlinePayment,
    required this.cod,
    required this.completed,
    required this.pending,
    required this.total,
    required this.cancel,
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentsCard> createState() => _PaymentsCardState();
}

class _PaymentsCardState extends State<PaymentsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
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
                            const Text(
                              textAlign: TextAlign.center,
                              'Online\nPayments',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.onlinePayment,
                              style: const TextStyle(
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
              const SizedBox(width: 15,),
              Expanded(
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DeliveryLocTracking()),
                      );
                    },
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
                              const Text(
                                textAlign: TextAlign.center,
                                'COD\nPayments',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",
                                ),
                              ),
                              Text(
                                widget.cod,
                                style: const TextStyle(
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
              ),
            ],
          ),
          const SizedBox(height: 10,),
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
                            const Text(
                              textAlign: TextAlign.center,
                              'Complete\n Orders',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.completed,
                              style: const TextStyle(
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
              const SizedBox(width: 15,),
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
                            const Text(
                              textAlign: TextAlign.center,
                              'Pending\nOrder',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.pending,
                              style: const TextStyle(
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
          const SizedBox(height: 10,),
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
                            const Text(
                              textAlign: TextAlign.center,
                              'Total\n Orders',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.total,
                              style: const TextStyle(
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
              const SizedBox(width: 15,),
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
                            const Text(
                              textAlign: TextAlign.center,
                              'Cancel\nOrders',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Muli",
                              ),
                            ),
                            Text(
                              widget.cancel,
                              style: const TextStyle(
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
        ],
      ),
    );
  }
}
