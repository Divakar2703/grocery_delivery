import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery_delivery_side/data/models/request/indextPageCountRequestModel.dart';
import 'package:grocery_delivery_side/data/models/response/codSummaryResponseModel.dart';
import 'package:grocery_delivery_side/data/models/response/walletSummaryResponseModel.dart';
import 'package:grocery_delivery_side/repositories/repo_summary.dart';

import '../data/processResponse/api_process_response.dart';

class SummaryViewModel with ChangeNotifier{
  final _summaryListRepo = SummaryRepository();

  ApiProcessResponse<CodSummaryResponseModel> codSummaryListData = ApiProcessResponse.loading();
  setCodSummaryListData(ApiProcessResponse<CodSummaryResponseModel> response) {
    codSummaryListData = response;
    notifyListeners();
  }


  Future<void> fetchCodSummaryListData(IndextPageCountRequestModel data, BuildContext context) async {
    setCodSummaryListData(ApiProcessResponse.loading());
    try {
      final CodSummaryResponseModel codSummaryResponseModel = await _summaryListRepo.fetchCodSummaryListData(data);

      if (codSummaryResponseModel.status == 'error') {
        setCodSummaryListData(
            ApiProcessResponse.error(codSummaryResponseModel.message));
      } else {
        setCodSummaryListData(ApiProcessResponse.completed(codSummaryResponseModel));

      }

      if (kDebugMode) {
        print("Data aa ha hai${codSummaryResponseModel.status}");
      }

    } catch (error) {
      if (error is SocketException) {
        setCodSummaryListData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setCodSummaryListData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setCodSummaryListData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setCodSummaryListData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }


      if (kDebugMode) {
        print("Kuchh to gadabad h Daya");
      }
    }
  }

  ApiProcessResponse<WalletSummaryResponseModel> walletSummaryListData = ApiProcessResponse.loading();
  setWalletSummaryListData(ApiProcessResponse<WalletSummaryResponseModel> response) {
    walletSummaryListData = response;
    notifyListeners();
  }


  Future<void> fetchWalletSummaryListData(IndextPageCountRequestModel data, BuildContext context) async {
    setWalletSummaryListData(ApiProcessResponse.loading());
    try {
      final WalletSummaryResponseModel walletSummaryListResponseModel = await _summaryListRepo.fetchWalletSummaryListData(data);

      if (walletSummaryListResponseModel.status == 'error') {
        setWalletSummaryListData(
            ApiProcessResponse.error(walletSummaryListResponseModel.message));
      } else {
        setWalletSummaryListData(ApiProcessResponse.completed(walletSummaryListResponseModel));

      }

      if (kDebugMode) {
        print("Data aa ha hai${walletSummaryListResponseModel.status}");
      }

    } catch (error) {
      if (error is SocketException) {
        setWalletSummaryListData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setWalletSummaryListData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setWalletSummaryListData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setWalletSummaryListData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }

      if (kDebugMode) {
        print("Kuchh to gadabad h Daya");
      }
    }
  }

}