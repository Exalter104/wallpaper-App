// ignore_for_file: avoid_print

import 'package:wallpaper_app/controller/data/app_exception.dart';
import 'package:wallpaper_app/controller/data/network/base_api_services.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  List homeWallpaperModel = [];
  @override
  Future<dynamic> getApi(
      {required String url, Map<String, String>? header}) async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization':
            'XIiUuwAntckk2WNvYkitqUBZnI2iGblvdVBKdhvQdorjejObUp8CVNHF'
      }).timeout(const Duration(seconds: 15));
      print("print1  Url \n: $url");
      responseJson = returnResponseJson(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimout {
      throw RequestTimout();
    }
    return responseJson;
  }

  returnResponseJson(http.Response response) {
    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> responsJson = jsonDecode(response.body);
        homeWallpaperModel = responsJson["photos"];
        print("print2 response \n  : sheraz${homeWallpaperModel[0]}");
        // print("sheraz$homeWallpaperModel");
        return homeWallpaperModel;
      case 400:
        throw InvalidUrlException(response.body);
      case 401:
        throw InvalidTokenException(response.body);
      case 500:
        throw ServerException();
      default:
        throw FetchDataException(
            "Error while communicating  : ${response.statusCode.toString()}");
    }
  }
}
