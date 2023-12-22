import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/screens/Orders/Componenets/Pending/pending_view.dart';

class PendingCard extends StatefulWidget {
  const PendingCard({super.key});

  @override
  State<PendingCard> createState() => _PendingCardState();
}

class _PendingCardState extends State<PendingCard> {

  final List<Map<String, dynamic>> eventItems = [
    {
      'sr': '1',
      'date':'#38',
      'tid': '12-12-466',
      'ano': 'Mens',
      'bname':'T-shirt',
      'ifsc':'Sector 54,Gurgao',
      'amount':'121212121',
      's' : 'pending'

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
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3, // Adjust the flex values as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Sr. No. :",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            fontFamily: 'Mabry',

                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Listed Date :",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            fontFamily: 'Mabry',

                          ),
                        ),

                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Product Id :",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            fontFamily: 'Mabry',

                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Product Name :",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            fontFamily: 'Mabry',

                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Current stock :",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            fontFamily: 'Mabry',

                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Estimatedorder/day :",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            fontFamily: 'Mabry',

                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Day to stock out :",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            fontFamily: 'Mabry',

                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Status :",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade800,
                            fontFamily: 'Mabry',

                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3, // Adjust the flex values as needed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 5
                        ),
                        Text(
                          item['sr'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mabry',

                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          item['date'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mabry',

                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          item['tid'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mabry',

                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          item['ano'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mabry',

                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          item['bname'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mabry',

                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          item['ifsc'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mabry',

                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          item['amount'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mabry',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          item['s'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.yellow,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mabry',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        isDismissible: false,
                        enableDrag: false,
                        builder: (_) => PendingView(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Change 'Colors.blue' to the color you want
                    ),
                    child: Text(
                      'View',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Mabry',

                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // showModalBottomSheet(
                      //   context: context,
                      //   isScrollControlled: true,
                      //   isDismissible: false,
                      //   enableDrag: false,
                      //   builder: (_) => WlProfile(),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Change 'Colors.blue' to the color you want
                    ),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Mabry',

                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
