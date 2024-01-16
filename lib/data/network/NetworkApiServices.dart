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
      await http.get(Uri.parse(url)).timeout(Duration(seconds: 90));
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
          body: body).timeout(Duration(seconds: 90));

      responseJson = returnResponse(response);
      print('Netservice2================$responseJson');

    } on SocketException {
      throw FetchDataException('No Internet Connection');
      print('FetchDataException================$responseJson');

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
}
