import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/constants.dart';

void openReturnOrderBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Set this to true

    builder: (BuildContext context) {
      return Container(
        height: 320,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          child: Scaffold(
            backgroundColor: Color(0xFFFAFBFB),
            appBar: AppBar(
              // backgroundColor:Color(0xFFF2F8FA),
              elevation: 4.0,
              centerTitle: true,
              automaticallyImplyLeading: false,

              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              title: Text(
                "Return Order",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "OTP",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    height: 36,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter OTP",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
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
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey
                      )
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Reason for Return",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                        contentPadding: EdgeInsets.only(left: 16), // Adjust left padding
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),



                  SizedBox(height: 10,),
                Container(
                  alignment: Alignment.center,
                  height: 36,
                  width: 100,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('Submit',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Muli",
                    ),
                  ),
                )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}