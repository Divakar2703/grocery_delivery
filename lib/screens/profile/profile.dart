
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectedImagePath = ''; // To store the selected image path

  Future selectImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 180,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Select Profile Image',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              selectedImagePath =
                                  await selectImageFromGallery();
                              final SharedPreferences sp =
                                  await SharedPreferences.getInstance();
                              sp.setString("profileImg", selectedImagePath);
                              print('Image_Path:-');
                              print(selectedImagePath);
                              if (selectedImagePath != '') {
                                Navigator.pop(context);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("No Image Selected !"),
                                ));
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/gallery.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                  const Text('Gallery'),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              selectedImagePath = await selectImageFromCamera();
                              print('Image_Path:-');
                              print(selectedImagePath);
                              final SharedPreferences sp =
                                  await SharedPreferences.getInstance();
                              sp.setString("profileImg", selectedImagePath);
                              if (selectedImagePath != '') {
                                Navigator.pop(context);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("No Image Captured !"),
                                ));
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/camera.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                  const Text('Camera'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff81bab4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            width: double.infinity,
            child: Column(
              children: [
                Transform.translate(
                  offset: Offset(0, -35), // Adjust the values as needed
                  child: GestureDetector(
                    onTap: (){
                      selectImage(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white, // Set the border color
                          width: 5.0, // Set the border width
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: selectedImagePath.isNotEmpty
                            ? AssetImage(selectedImagePath)
                            : AssetImage("assets/images/Profile Image.png"),
                        radius: 50,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Chandrabhan Singh',
                  style: TextStyle(
                    fontFamily: "Muli",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'mlacbsaakya@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ProfileContainer(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff81bab4),
                          spreadRadius: 2,
                          blurRadius: 03,
                          offset: Offset(1, 1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address :',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: "Muli",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: Text(
                          'bilaspur north , Wardha , Maharashtra , India , - 343553',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w500,
                          ),
                          //   maxLines: 1, // Set maximum number of lines
                          //    overflow: TextOverflow.ellipsis, // Handle overflow by showing ellipsis
                        ),
                      ),
                    ],
                  ),
                ),
                CardWidget_R(
                  title: 'Update Your Profile',
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff81bab4),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/icons/logout-svgrepo-com-2.svg",
                          // Replace with your SVG path
                          height: 18,
                          width: 16,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          //  Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        'LogOut',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff81bab4),
          spreadRadius: 2,
          blurRadius: 03,
          offset: Offset(1, 1), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white38,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 04,
                        offset: Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.arrow_turn_right_up,
                        size: 18,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                              fontFamily: 'Muli',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Active',
                            style: TextStyle(
                              fontFamily: 'Muli',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white38,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 04,
                        offset: Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.star_lefthalf_fill,
                        size: 18,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                              fontFamily: 'Muli',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Active',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Name :',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'User id :',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Date of Joining :',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Phone :',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Leave Form Date :',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Leave To Date :',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        'Bhupendra thakur',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Bhupefowf',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '03-10-2023 4:26 pm',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '+9124302430',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '30-11--0001',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '30-11--0001',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardWidget_R extends StatelessWidget {
  final String title;

  const CardWidget_R({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfile()),
          );
        },
        child: Card(
          shadowColor: Color(0xff81bab4),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_right), // Wrap icon with Icon widget
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
