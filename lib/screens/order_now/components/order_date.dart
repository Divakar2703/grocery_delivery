import 'package:flutter/material.dart';

class OrderDate extends StatefulWidget {
  const OrderDate({Key? key}) : super(key: key);

  @override
  State<OrderDate> createState() => _OrderDateState();
}

class _OrderDateState extends State<OrderDate> {
  final List<Map<String, dynamic>> dates = [
    {'date': '15 Aug', 'day': 'Monday', 'color': Colors.green},
    {'date': '16 Aug', 'day': 'Tuesday', 'color': Colors.white},
    {'date': '17 Aug', 'day': 'Wednesday', 'color': Colors.white},
    // Add more dates as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: dates.map((dateInfo) {
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.only(top: 16,bottom: 16,right: 16,left: 16),
            //height: 120,
           // width: 150,
            decoration: BoxDecoration(
              color: dateInfo['color'],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 3,
                color: Colors.grey,
              ),
            ),
            child: Column(
              children: [
                Text(
                  dateInfo['date'],
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black87,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  dateInfo['day'],
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
