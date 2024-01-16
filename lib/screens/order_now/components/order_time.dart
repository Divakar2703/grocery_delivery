import 'package:flutter/material.dart';

class OrderTime extends StatefulWidget {
  const OrderTime({Key? key}) : super(key: key);

  @override
  State<OrderTime> createState() => _OrderTimeState();
}

class _OrderTimeState extends State<OrderTime> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> timeSlots = [
      {'time': '5pm – 7pm', 'payout': 'Payout Per Hour ₹55 - ₹65'},
      {'time': '7pm – 9pm', 'payout': 'Payout Per Hour ₹60 - ₹70'},
      {'time': '5pm – 7pm', 'payout': 'Payout Per Hour ₹55 - ₹65'},
      {'time': '7pm – 9pm', 'payout': 'Payout Per Hour ₹60 - ₹70'},
      {'time': '5pm – 7pm', 'payout': 'Payout Per Hour ₹55 - ₹65'},
      {'time': '7pm – 9pm', 'payout': 'Payout Per Hour ₹60 - ₹70'},
    ];

    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Column(
            children: timeSlots.map((timeSlot) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            timeSlot['time']!,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontFamily: "Muli",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            timeSlot['payout']!,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontFamily: "Muli",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Checkbox(
                        value: isSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            isSelected = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey, // Adjust color if needed
                    thickness: 1, // Adjust thickness as needed
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
