import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_delivery_side/data/models/request/indextPageCountRequestModel.dart';
import 'package:grocery_delivery_side/data/models/response/getProfileResponseModel.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/login_page.dart';
import 'package:grocery_delivery_side/style/colors.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/constants/app_constants_value.dart';
import '../../data/processResponse/api_process_response.dart';
import '../../data/processResponse/status.dart';
import '../../helper/empty_animation.dart';
import '../Orders/Componenets/All/simmer_order_list.dart';
import 'edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectedImagePath = ''; // To store the selected image path
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    super.initState();
    profileViewModel = ProfileViewModel();
    // This is your existing code to fetch profile data
    final data = IndextPageCountRequestModel(userId: Constants.userIdForUse);
    profileViewModel.fetchProfileData(data, context);
  }

  Future<void> selectImage(BuildContext context) async {
    try {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: 180,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Select Profile Image',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                              selectedImagePath = await selectImageFromGallery();
                              Navigator.pop(context);
                              if (selectedImagePath != '') {
                                await profileViewModel.uploadProfileImage(selectedImagePath, Constants.userIdForUse);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
                              Navigator.pop(context);
                              if (selectedImagePath != '') {
                                await profileViewModel.uploadProfileImage(selectedImagePath, Constants.userIdForUse);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
        },
      );
    } catch (e) {
      print('Error selecting image: $e');
    }
  }

  Future<String> selectImageFromGallery() async {
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 10,
    );
    return file?.path ?? '';
  }

  Future<String> selectImageFromCamera() async {
    final XFile? file = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 10,
    );
    return file?.path ?? '';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: ChangeNotifierProvider<ProfileViewModel>(
        create: (BuildContext context) => profileViewModel,
        child: Consumer<ProfileViewModel>(
          builder: (context, value, _) {
            switch (value.getProfileData.status ?? "") {
              case Status.LOADING:
                return Center(child: buildShimmerProductDetails());
              case Status.ERROR:
                return Center(child: emptyAnimationWidget());
              case Status.COMPLETED:
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 16),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30))),
                        width: double.infinity,
                        child: Column(
                          children: [
                            const SizedBox(height: 80,),
                            Transform.translate(
                              offset: const Offset(0, -35),
                              child: GestureDetector(
                                onTap: () {
                                  selectImage(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 5.0,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: selectedImagePath.isNotEmpty
                                        ? FileImage(File(selectedImagePath))
                                        : value.getProfileData.data!.profileImage!.isNotEmpty
                                        ? NetworkImage(value.getProfileData.data!.profileImage!)
                                        : AssetImage("assets/images/Profile Image.png") as ImageProvider<Object>,
                                    radius: 50,
                                  ),
                                ),
                              ),
                            ),

                            Text(
                              value.getProfileData.data!.name.toString(),
                              style: TextStyle(
                                fontFamily: "Muli",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              value.getProfileData.data!.emailId.toString(),
                              style: TextStyle(
                                fontFamily: 'Muli',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ProfileContainer(getProfileData: value.getProfileData!.data,),
                            Container(
                              margin:
                              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    const BoxShadow(
                                      color: AppColors.lightGreen,
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
                                  const Text(
                                    'Address :',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "Muli",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  Expanded(
                                    child: Text(
                                      value.getProfileData.data!.address.toString(),
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
                              getProfileResponseModel: value.getProfileData!.data,
                            ),
                            Container(
                              margin: const EdgeInsets.all(8),
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color:  AppColors.primaryColor2,
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      "assets/icons/logout-svgrepo-com-2.svg",
                                      // Replace with your SVG path
                                      height: 18,
                                      width: 16,
                                      color: Colors.white,
                                    ),
                                    onPressed: () async {
                                      // Clear shared preferences
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.clear();
                                      // Navigate to the login screen
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(builder: (context) => const LoginUser()),
                                            (Route<dynamic> route) => false,
                                      );
                                    },
                                  ),
                                  const Text(
                                    "LogOut",
                                    style: TextStyle(
                                      fontFamily: "Muli",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

}

class ProfileContainer extends StatefulWidget {
  final GetProfileResponseModel? getProfileData;
  const ProfileContainer({super.key, required this.getProfileData});

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(boxShadow: [
        const BoxShadow(
          color: AppColors.lightGreen,
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                        offset: const Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.arrow_turn_right_up,
                        size: 18,
                        color: AppColors.primaryColor2,
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
                              color: AppColors.primaryColor2,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white38,
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.4),
                //         spreadRadius: 2,
                //         blurRadius: 04,
                //         offset: Offset(2, 2), // changes position of shadow
                //       ),
                //     ],
                //   ),
                //   child: Row(
                //     children: [
                //       Icon(
                //         CupertinoIcons.star_lefthalf_fill,
                //         size: 18,
                //         color: Colors.red,
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Column(
                //         children: [
                //           Text(
                //             'Status',
                //             style: TextStyle(
                //               fontFamily: 'Muli',
                //               fontWeight: FontWeight.bold,
                //               fontSize: 15,
                //               color: Colors.black,
                //             ),
                //           ),
                //           Text(
                //             'Active',
                //             style: TextStyle(
                //               fontFamily: 'Mulish',
                //               fontWeight: FontWeight.bold,
                //               fontSize: 15,
                //               color: Colors.red,
                //             ),
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  const Column(
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
                      const SizedBox(height: 5),
                      Text(
                        widget.getProfileData!.name.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        Constants.userIdForUse,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
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
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.getProfileData!.mobileNo.toString(),

                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.getProfileData!.leaveStartDate.toString(),

                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.getProfileData!.levEndDate.toString(),

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

class CardWidget_R extends StatefulWidget {
  final String title;
  final GetProfileResponseModel? getProfileResponseModel;

  const CardWidget_R({
    Key? key,
    required this.title, required this.getProfileResponseModel,
  }) : super(key: key);

  @override
  State<CardWidget_R> createState() => _CardWidget_RState();
}

class _CardWidget_RState extends State<CardWidget_R> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  EditProfile(getProfileData: widget.getProfileResponseModel,)),
          );
        },
        child: Card(
          shadowColor: AppColors.primaryColor2,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_right), // Wrap icon with Icon widget
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
