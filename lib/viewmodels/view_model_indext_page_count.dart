import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/otp_screen.dart';
import '../data/models/request/indextPageCountRequestModel.dart';
import '../data/models/response/indextPageCountResponseModel.dart';
import '../data/processResponse/api_process_response.dart';
import '../repositories/repo_indext_page_count.dart';


class IndextPageCountViewModel with ChangeNotifier {
  final _indextPageCountRepo = IndextPageCountRepository();

  ApiProcessResponse<IndextPageCountResponseModel> indextPageCountData = ApiProcessResponse.loading();

  setIndextPageCountData(ApiProcessResponse<IndextPageCountResponseModel> response) {
    indextPageCountData = response;
    notifyListeners();
  }

  Future<void> fetchIndextPageCountData(IndextPageCountRequestModel data, BuildContext context) async {
    setIndextPageCountData(ApiProcessResponse.loading());
    try {
      final IndextPageCountResponseModel indextPageCountResponseModel = await _indextPageCountRepo.fetchIndextPageCountData(data);
      setIndextPageCountData(ApiProcessResponse.completed(indextPageCountResponseModel));

      if (kDebugMode) {
        print("Data aa ha hai${indextPageCountResponseModel.status}");

      }
      if(indextPageCountResponseModel.record?.deliUserId!=null){
        var userId = indextPageCountResponseModel.record?.deliUserId.toString();
        print("==================================$userId");

        //       userId: Constants.userIdForUse
        // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(userId: userId,),),);
      }


    } catch (error) {
      if (error is SocketException) {
        setIndextPageCountData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setIndextPageCountData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setIndextPageCountData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setIndextPageCountData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }
      final IndextPageCountResponseModel indextPageCountResponseModel = await _indextPageCountRepo.fetchIndextPageCountData(data);
      setIndextPageCountData(ApiProcessResponse.completed(indextPageCountResponseModel));

      if (kDebugMode) {
        print("Kuchh to gadabad h Dya");
      }
    }
  }
}