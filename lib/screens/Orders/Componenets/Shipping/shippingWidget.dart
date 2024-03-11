
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants.dart';
import '../Shipping/shippingCard.dart';
import '../select_date_and_search_date_widget.dart';


class ShippingWidget extends StatefulWidget {
  const ShippingWidget({super.key});

  @override
  State<ShippingWidget> createState() => _AllWidgetState();
}

class _AllWidgetState extends State<ShippingWidget> {



  List<String> items = ['1', '2', '3','4','5'];
  String? selectItem = '1';




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(8),
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xfff9f9f9),
              ),
              child: Column(
                children: [

                  SelectDateAndSearchDate(),

                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Show  ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 35,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectItem,
                              items: items.map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                              ).toList(),
                              onChanged: (item) {
                                setState(() {
                                  selectItem = item;
                                });
                              },
                            ),
                          ),
                        ),
                        Text('  entries',
                          style: TextStyle(
                            fontFamily: 'Muli',
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 5,),
                  Divider(
                    thickness: 1,
                  ),


                  SizedBox(height: 10,),
                  ShippingCard(),

                  SizedBox(height: 10,),
                  Text(
                    'Show 0 to 0of 0 entries',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Muli',
                      color: Colors.grey.shade700,
                    ),
                  ),

                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          border: Border.all(
                            color: Colors.grey, // You can change this color to the desired border color
                            width: 1.0, // You can adjust the border width as needed
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                          child: Text(
                            'Previous',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: 'Muli'
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          border: Border.all(
                            color: Colors.grey, // You can change this color to the desired border color
                            width: 1.0, // You can adjust the border width as needed
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                          child: Text(
                            '2',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: 'Mabry'
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // You can change this color to the desired border color
                            width: 1.0, // You can adjust the border width as needed
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: 'Mabry'
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

        ],
      ),
    );
  }
}
