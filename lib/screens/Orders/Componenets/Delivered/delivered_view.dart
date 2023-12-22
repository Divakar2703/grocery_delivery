import 'package:flutter/material.dart';

class DeliveredView extends StatefulWidget {
  const DeliveredView({super.key});

  @override
  State<DeliveredView> createState() => _DeliveredViewState();
}

class _DeliveredViewState extends State<DeliveredView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Id - #122',
                style: TextStyle(
                  color: Color(0xff8c7dff),
                  fontSize: 22,
                  fontFamily: 'Mabry',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),


          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "20/12/2022",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      fontFamily: 'Mabry',

                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey
                    ),
                    child: Image.asset('assets/n.jpg'),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trech Coat",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mabry',
                        ),
                      ),
                      Text(
                        "Size : XL",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mabry',
                        ),
                      ),
                      Text(
                        "Price :Rs3000",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mabry',
                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  Text(
                    "Qty:2",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mabry',
                    ),
                  ),

                ],
              ),

              Row(
                children: [
                  Text(
                    "Method of Payment :",
                    style: TextStyle(
                      color: Color(0xff444242),
                      fontSize: 20,
                      fontFamily: 'Mabry',
                    ),
                  ),
                  Text(
                    "  Online",
                    style: TextStyle(
                      color: Color(0xff4f9eee),
                      fontSize: 20,
                      fontFamily: 'Mabry',
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Text(
                    "Status :",
                    style: TextStyle(
                      color: Color(0xff444242),
                      fontSize: 20,
                      fontFamily: 'Mabry',
                    ),
                  ),
                  Text(
                    "Delivered",
                    style: TextStyle(
                      color: Color(0xff61f50b),
                      fontSize: 20,
                      fontFamily: 'Mabry',
                    ),
                  ),
                ],
              ),

              Divider(
                thickness: 1,
              ),

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
                          "Order Price",
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
                          "Category",
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
                          "User Name",
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
                          "User Address",
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
                          "Order Placed Date",
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
                          "Rs3000",
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
                          "Men's",
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
                          "Ram",
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
                          "Faridabad",
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
                          "23-25 Nov,2022",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mabry',

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Divider(
                thickness: 1,
              ),


              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

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
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Mabry',

                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: () {
                      // showModalBottomSheet(
                      //   context: context,
                      //   isScrollControlled: true,
                      //   isDismissible: false,
                      //   enableDrag: false,
                      //   builder: (_) => RequestOrderView(),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Change 'Colors.blue' to the color you want
                    ),
                    child: Text(
                      'Accept',
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
        ],
      ),
    );
  }
}
