import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateAndSearchDateWalletSummary extends StatefulWidget {
  const SelectDateAndSearchDateWalletSummary({super.key});

  @override
  State<SelectDateAndSearchDateWalletSummary> createState() => _SelectDateAndSearchDateState();
}

class _SelectDateAndSearchDateState extends State<SelectDateAndSearchDateWalletSummary> {

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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [



          SizedBox(
            height: 38, // Specify the desired height here
            child: ElevatedButton(
              onPressed: () => _selectDateRange(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
                  side: BorderSide(color: Colors.black54), // Set the border color
                ),
                primary: Colors.white, // Set the background color
              ),
              child: Text(
                _startDate == null || _endDate == null
                    ? 'Select Date'
                    : ' ${_formatDate(_startDate)} - ${_formatDate(_endDate)}',
                style: TextStyle(color: Colors.black54,fontSize: 16), // Set the text color
              ),
            ),
          ),

          SizedBox(height: 10,),
          Container(
            height: 38,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                hintText: "Search Here....",
                hintStyle: TextStyle(color: Colors.black54),
                contentPadding: EdgeInsets.only(left: 16), // Adjust left padding
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green
                  ),
                  child:  Text('Reset all',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Muli",
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.center,
                  height: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue
                  ),
                  child:  Text('Search',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Muli",
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
