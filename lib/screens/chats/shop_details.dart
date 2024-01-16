import 'package:flutter/material.dart';

import '../../constants.dart';

class ShopDetails extends StatefulWidget {
  const ShopDetails({super.key});

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shop Detail',
                style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontFamily: "Muli",
                    fontWeight: FontWeight.w600
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
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200, // Adjust the width as needed
                height: 150, // Adjust the height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Radius half of the width/height for a circular shape
                  image: DecorationImage(
                    image: AssetImage('assets/images/shop.jpeg'), // Replace 'your_image.png' with your image path
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),

          Row(
            children: [
              Expanded(
                flex: 2, // Adjust the flex values as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Contact No. :",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade800,
                        fontFamily: "Muli",
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Email ID :",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade800,
                        fontFamily: "Muli",
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "User ID :",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade800,
                        fontFamily: "Muli",
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Location :",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade800,
                        fontFamily: "Muli",
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
                      "+91-609345093 ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "gwdjio13@gmail.com ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Deva@487312",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Mg Road,gopal nagar ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
