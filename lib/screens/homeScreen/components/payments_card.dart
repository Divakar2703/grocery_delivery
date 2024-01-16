import 'package:flutter/material.dart';

class PaymentsCard extends StatefulWidget {
  const PaymentsCard({Key? key}) : super(key: key);

  @override
  State<PaymentsCard> createState() => _PaymentsCardState();
}

class _PaymentsCardState extends State<PaymentsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
      ),
      child: Row(
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
                          'Online\nPayments',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Muli",
                          ),
                        ),
                        Text(
                          '(1)',
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
                          'COD\nPayments',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Muli",
                          ),
                        ),
                        Text(
                          '(1)',
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
    );
  }
}
