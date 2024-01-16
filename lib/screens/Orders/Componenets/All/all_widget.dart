import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../Cancelled/cancelled_card.dart';
import '../Pending/p_card.dart';


class AllWidget extends StatefulWidget {
  const AllWidget({super.key});

  @override
  State<AllWidget> createState() => _AllWidgetState();
}

class _AllWidgetState extends State<AllWidget> {

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
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Show',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 40,
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
                        Text('entries',
                          style: TextStyle(
                            fontFamily: 'Muli',
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    height: 45,
                    margin:EdgeInsets.all(8) ,
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                          hintText: "Search here...",
                          hintStyle: TextStyle(color: Colors.black54),
                          contentPadding: EdgeInsets.only(left: 16), // Adjust left padding
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Divider(
                    thickness: 1,
                  ),


                  SizedBox(height: 10,),
                  PCard(),
                  CancelledCard(),

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
