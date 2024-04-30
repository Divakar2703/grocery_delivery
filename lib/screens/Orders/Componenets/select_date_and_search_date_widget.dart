import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/screens/map/delivery_loc_tracking.dart';
import 'package:grocery_delivery_side/style/colors.dart';
import 'package:intl/intl.dart';

import '../orderListTabFoodGrocery.dart';

class SelectDateAndSearchDate extends StatefulWidget {
  const SelectDateAndSearchDate({super.key});

  @override
  State<SelectDateAndSearchDate> createState() => _SelectDateAndSearchDateState();
}

class _SelectDateAndSearchDateState extends State<SelectDateAndSearchDate> {

  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now(),
      initialDateRange: _getDateRange(),
    );

    if (picked != null && picked != _getDateRange()) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
    }
  }

  DateTimeRange? _getDateRange() {
    if (_startDate != null && _endDate != null) {
      return DateTimeRange(start: _startDate!, end: _endDate!);
    }
    return null;
  }

  String _formatDate(DateTime? date) {
    if (date != null) {
      return DateFormat('yyyy-MM-dd').format(date); // Format the date as desired
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [

          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         padding: EdgeInsets.symmetric(horizontal: 16),
          //         height: 38,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.red
          //         ),
          //         child:  const Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Icon(Icons.picture_as_pdf_outlined,color: Colors.white,size: 18,),
          //             SizedBox(width: 10,),
          //             Text('Save as PDF',
          //               style: TextStyle(
          //                 fontSize: 16,
          //                 color: Colors.white,
          //                 fontFamily: "Muli",
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     const SizedBox(width: 10,),
          //     GestureDetector(
          //       child: Container(
          //         padding: EdgeInsets.symmetric(horizontal: 24),
          //         alignment: Alignment.center,
          //         height: 38,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.green
          //         ),
          //         child:  const Text('Reset all',
          //           style: TextStyle(
          //             fontSize: 16,
          //             color: Colors.white,
          //             fontFamily: "Muli",
          //           ),
          //         ),
          //       ),
          //     ),
          //
          //   ],
          // ),
          // const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 38, // Specify the desired height here
                  child: ElevatedButton(
                    onPressed: () => _selectDateRange(context),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
                      ),backgroundColor: AppColors.categoryCardColor2, // Set the background color
                    ),
                    child: Text(
                      _startDate == null || _endDate == null
                          ? 'Select Date'
                          : ' ${_formatDate(_startDate)} - ${_formatDate(_endDate)}',
                      style: TextStyle(color: Colors.black54,fontSize: 14), // Set the text color
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: (){
                  // 26.98059427340072, 75.77338746034187
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ParentOrderListFoodGrocery()),
                    );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  height: 37,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor2
                  ),
                  child:  const Text('Search',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Muli",
                    ),
                  ),
                ),
              )
            ],
          ),

        ],



      ),
    );
  }
}
