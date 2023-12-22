import 'package:flutter/material.dart';

import 'cancelled_card.dart';

class CancelledWidget extends StatefulWidget {
  const CancelledWidget({super.key});

  @override
  State<CancelledWidget> createState() => _CancelledWidgetState();
}

class _CancelledWidgetState extends State<CancelledWidget> {

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
                    padding: const EdgeInsets.only(left: 24,right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Show',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade700,
                                fontFamily: 'Mabry'
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38),
                              borderRadius: BorderRadius.circular(5),
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
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('entries',
                            style: TextStyle(
                              fontFamily: 'Mabry',
                              fontSize: 18,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 24,right: 24),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child:Text('Search:',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade700,
                                fontFamily: 'Mabry'
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                            flex:6,
                            child:Container(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "",
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Divider(
                    thickness: 1,
                  ),


                  SizedBox(height: 10,),
                  CancelledCard(),

                  SizedBox(height: 10,),
                  Text(
                    'Show 0 to 0of 0 entries',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Mabry',
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
                                fontFamily: 'Mabry'
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 38,
                        decoration: BoxDecoration(
                          color: Color(0xff8c7dff),
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
