import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
      //  color: Colors.blue.shade200
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All Type Orders',
            style: TextStyle(
                fontSize: 17,
                color: Colors.grey.shade900,
                fontFamily: "Muli",
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 165,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 90, // Adjust the height of the image container
                            width: 100, // Adjust the width of the image container
                            child: Image.asset(
                              'assets/images/cc.png', // Replace this with your image asset path
                              //fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 0), // Adjust the spacing between the image and text
                          Text(
                            'Complete\n Orders',
                            style: TextStyle(
                              color: Colors.white70, // Assuming you want the text to be white
                              fontSize: 15, // Adjust the font size as needed
                              fontWeight: FontWeight.w500,
                              fontFamily: "Muli",// Adjust the font weight as needed
                            ),
                          ),
                          Text(
                            '(1)',
                            style: TextStyle(
                              color: Colors.white60, // Assuming you want the text to be white
                              fontSize: 15, // Adjust the font size as needed
                              fontWeight: FontWeight.w500,
                              fontFamily: "Muli",// Adjust the font weight as needed
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10,),
                
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFFFDB96A),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Pending Order',
                                style: TextStyle(
                                  color: Colors.white70, // Assuming you want the text to be white
                                  fontSize: 15, // Adjust the font size as needed
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",// Adjust the font weight as needed
                                ),
                              ),
                              Text(
                                '(1)',
                                style: TextStyle(
                                  color: Colors.white60, // Assuming you want the text to be white
                                  fontSize: 15, // Adjust the font size as needed
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",// Adjust the font weight as needed
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 50, // Adjust the height of the image container
                            width: 50, // Adjust the width of the image container
                            child: Image.asset(
                              'assets/images/p.png', // Replace this with your image asset path
                              //fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                
                  ],
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFFFDB96A),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Order',
                                style: TextStyle(
                                  color: Colors.white70, // Assuming you want the text to be white
                                  fontSize: 15, // Adjust the font size as needed
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",// Adjust the font weight as needed
                                ),
                              ),
                              Text(
                                '(1)',
                                style: TextStyle(
                                  color: Colors.white60, // Assuming you want the text to be white
                                  fontSize: 15, // Adjust the font size as needed
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Muli",// Adjust the font weight as needed
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 50, // Adjust the height of the image container
                            width: 50, // Adjust the width of the image container
                            child: Image.asset(
                              'assets/images/k.png', // Replace this with your image asset path
                              //fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                
                    Container(
                      height: 165,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 90, // Adjust the height of the image container
                            width: 100, // Adjust the width of the image container
                            child: Image.asset(
                              'assets/images/c.png', // Replace this with your image asset path
                              //fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Delivery cancel Orders',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70, // Assuming you want the text to be white
                              fontSize: 15, // Adjust the font size as needed
                              fontWeight: FontWeight.w500,
                              fontFamily: "Muli",// Adjust the font weight as needed
                            ),
                          ),
                          Text(
                            '(1)',
                            style: TextStyle(
                              color: Colors.white60, // Assuming you want the text to be white
                              fontSize: 15, // Adjust the font size as needed
                              fontWeight: FontWeight.w500,
                              fontFamily: "Muli",// Adjust the font weight as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                
                  ],
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
