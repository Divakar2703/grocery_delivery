import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart'; // Import PermissionHandler
import 'package:grocery_delivery_side/screens/profile/profile_edit.dart';
import '../../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 24, top: 8),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24))),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  "assets/icons/left-arrow-svgrepo-com.svg",
                                  height: 26,
                                  width: 26,
                                  color: kPrimaryColor,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                  "assets/icons/8666681_edit_icon.svg",
                                  height: 24,
                                  width: 24,
                                  color: kPrimaryColor,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ProfileEdit(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 60,
                            foregroundColor: Colors.white,
                            child: ClipOval(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white70,
                                    width: 1.7,
                                  ),
                                ),
                                child: Image.asset(
                                  "assets/images/Profile Image.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Bhupendra thakur',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.black87,
                                fontFamily: "Muli",
                                fontWeight: FontWeight.w800),
                          ),
                          const Text(
                            'ewqi448@gmail.com',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontFamily: "Muli",
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    // Additional widgets
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void askLocationPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      // Location permission granted, proceed with your logic
    } else {
      // Location permission denied, handle accordingly
      // You can display a message or navigate the user to a screen where they can manually enable location permission
    }
  }

  @override
  void initState() {
    super.initState();
    askLocationPermission();
  }
}
