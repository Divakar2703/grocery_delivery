import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/ProfileUpdateRequestModel.dart';
import 'package:grocery_delivery_side/data/models/response/ProfileUpdateResponseModel.dart';
import 'package:grocery_delivery_side/repositories/repo_profile.dart';
import '../data/processResponse/api_process_response.dart';

class ProfileViewModel with ChangeNotifier {
  final _profileRepo = ProfileRepository();

  ApiProcessResponse<ProfileUpdateResponseModel> profileUpdateData = ApiProcessResponse.loading();

  updateProfileData(ApiProcessResponse<ProfileUpdateResponseModel> response) {
    profileUpdateData = response;
    notifyListeners();
  }

  Future<void> fetchUpdateProfileData(ProfileUpdateRequestModel data, BuildContext context) async {
    updateProfileData(ApiProcessResponse.loading());
    try {
      final ProfileUpdateResponseModel profileUpdateResponseModel = await _profileRepo.fetchProfileUpdateData(data);
      updateProfileData(ApiProcessResponse.completed(profileUpdateResponseModel));

      if (kDebugMode) {
        print("Data aa ha hai${profileUpdateResponseModel.status}");

      }
      if(profileUpdateResponseModel.status! =="success"){
        showToast("Profile updated successfully!.");
        Navigator.pop(context);
      }else{
        showToast(profileUpdateResponseModel.message.toString());
      }

    } catch (error) {
      if (error is SocketException) {
        updateProfileData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        updateProfileData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        updateProfileData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        updateProfileData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }
      final ProfileUpdateResponseModel profileUpdateResponseModel = await _profileRepo.fetchProfileUpdateData(data);
      updateProfileData(ApiProcessResponse.completed(profileUpdateResponseModel));

      if (kDebugMode) {
        print("Kuchh to gadabad h Dya");
      }
    }
  }
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}