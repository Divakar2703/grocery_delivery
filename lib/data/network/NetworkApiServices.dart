import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'BaseApiServices.dart';
import 'app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
      await http.get(Uri.parse(url)).timeout(const Duration(seconds: 90));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    var body = json.encode(data);
    print('Netservice================$body');

    try {
      print('Netservice try================$body');

      Response response = await post(Uri.parse(url),
          headers: {
            "Authorization": "Basic " +
                base64Encode(utf8.encode("grossry123:grossry123"))
          },
          body: body).timeout(const Duration(seconds: 90));

      responseJson = returnResponse(response);
      print('Netservice2================$responseJson');

    } on SocketException {
      throw FetchDataException('No Internet Connection');
      print('FetchDataException================$responseJson');

    }
    return responseJson;
  }

  @override
  Future getPostApiWithoutData(String url) async {
    dynamic responseJson;

    try {

      Response response = await post(Uri.parse(url),
          headers: {
            "Authorization": "Basic " +
                base64Encode(utf8.encode("food123:food123"))
          },
         ).timeout(const Duration(seconds: 90));

      responseJson = returnResponse(response);
      print('Netservice2================$responseJson');

    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 500:
        throw Exception(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException('Error occurred while Communicating with Server' +
            'with status code' +
            response.statusCode.toString());
    }
  }

  @override
  Future getPostApiFoodResponse(String url, data) async {
    dynamic responseJson;
    var body = json.encode(data);

    print('Api Details:-  $url \n $body');

    try {
      print('Netservice try================$body');

      Response response = await post(Uri.parse(url),
          headers: {
            "Authorization": "Basic " +
                base64Encode(utf8.encode("food123:food123"))
          },
          body: body).timeout(const Duration(seconds: 90));

      responseJson = returnResponse(response);
      // Logging the response
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

    } on SocketException {
      print('Error: No Internet Connection');
      throw FetchDataException('No Internet Connection');

    }
    return responseJson;
  }

  @override
  Future getPostApiRazorPayResponse(String url, data) async {
    dynamic responseJson;
    var body = json.encode(data);
    print('Netservice================$body');

    try {
      print('Netservice try================$body');

      Response response = await post(Uri.parse(url),
          headers: {
            "Authorization": "Basic " +
                base64Encode(utf8.encode("rzp_test_KyOM9fii555ipc:bunmWbUXdGyLG0q2ahsOlnJ2"))
          },
          body: body).timeout(const Duration(seconds: 90));

      responseJson = returnResponse(response);
      print('Netservice2================$responseJson');

    } on SocketException {
      throw FetchDataException('No Internet Connection');

    }
    return responseJson;
  }
}
