import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import '../data/constants/app_constants_value.dart';
import '../data/models/request/indextPageCountRequestModel.dart';
import '../viewmodels/view_model_indext_page_count.dart';
import '../viewmodels/view_model_profile.dart';
import 'homeScreen/components/home_header.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late IndextPageCountViewModel indextPageCountViewModel;
  late ProfileViewModel profileViewModel;
  bool _isOnline = false;


  @override
  void initState() {
    super.initState();
    indextPageCountViewModel = IndextPageCountViewModel();
    profileViewModel = ProfileViewModel();
    askLocationPermission();
    _getProfileData();
  }

  void askLocationPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      // Permission granted
    } else {
      // Handle denied permission
    }
  }
  Future<void> _getProfileData() async {
    final data = IndextPageCountRequestModel(userId: Constants.userIdForUse);
    try {
      await profileViewModel.fetchProfileData(data, context);

      // Assuming `profileViewModel.getProfileData` is properly updated by `fetchProfileData`
      String onlineStatus = profileViewModel.getProfileData.data!.onlineStauts.toString();
      setState(() {
        _isOnline = (onlineStatus == 'online');
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching profile data: $e');
      }
    }
  }

  void _toggleOnlineStatus(bool value) async{

    // You can call a method here to update the online status in your ViewModel or backend
    final indexCountRequestmodel = IndextPageCountRequestModel(
      userId: Constants.userIdForUse,
    );

    try {
      final response = await indextPageCountViewModel.fetchOnlineOfflineData(
        indexCountRequestmodel,
        context,
      );

      String onlineStatus = indextPageCountViewModel.onlineOfflineData.data!.onlineStauts.toString();
      setState(() {
        _isOnline = (onlineStatus == 'online');
      });

      print('API Response: $onlineStatus');
    } catch (e) {
      print('Error fetching online/offline data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Material(
            elevation: 4,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 32,16, 24),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  HomeHeader(
                    isOnline: _isOnline,
                    onStatusChanged: _toggleOnlineStatus,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
