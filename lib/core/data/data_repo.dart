// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:logistech/core/const/app_consts.dart';
import 'package:logistech/core/const/color.dart';

import 'package:logistech/core/network/network_info.dart';
import 'package:logistech/core/utils/app_router.dart';
import 'package:logistech/core/widget/custom_toast.dart';
import 'package:logistech/main.dart';

import 'data_state.dart';
import 'package:path/path.dart';
//import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class DataService {
  final http.Client _client;
  final NetworkInfo _networkInfo;

  DataService(this._client, this._networkInfo);

  Future<DataState<T>> getData<T>({
    String? token,
    required String endPoint,
    String baseUrl = baseUrl,
    Map<String, String>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      if (await checkInternet()) {
        return DataFailed(
          "No internet connection",
          statusCode: HttpStatus.serviceUnavailable,
        );
      }
      final response = await _client.get(
        Uri.parse(baseUrl + endPoint).replace(queryParameters: queryParameters),
        headers: headers(),
      );
      debugPrint('get param: $queryParameters');
      debugPrint('response: ${response.body}');
      return handleDataState(response: response, fromJson: fromJson!
      );
    } catch (e) {
      debugPrint('Error: $e');
      return DataFailed(
        "unknown error",
        statusCode: HttpStatus.internalServerError,
      );
    }
  }

  Future<DataState<T>> postDataWithListOfImages<T>({
    String? token,
    required String endPoint,
    required dynamic data,
    String baseUrl = baseUrl,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      if (await checkInternet()) {
        return DataFailed(
          "No internet connection",
          statusCode: HttpStatus.serviceUnavailable,
        );
      }

      var uri = Uri.parse(baseUrl + endPoint);
      var request = http.MultipartRequest('POST', uri);

      request.headers.addAll(headers());

      data.forEach((key, value) async {
        if (value is String) {
          request.fields[key] = value;
        } else if (value is List<String>) {
          for (String imagePath in value) {
            File imageFile = File(imagePath);
            request.files.add(
              http.MultipartFile(
                'images[]',
                imageFile.readAsBytes().asStream(),
                imageFile.lengthSync(),
                filename: basename(imageFile.path),
                contentType: MediaType('image', 'jpeg'),
              ),
            );
          }
        }
      });

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      debugPrint('response: $responseBody');

      return handleDataState(
        response: http.Response(responseBody, response.statusCode),
        fromJson: fromJson,
      );
    } catch (e) {
      debugPrint('Error: $e');
      return DataFailed(
        "unknown error",
        statusCode: HttpStatus.internalServerError,
      );
    }
  }

  Future<DataState<T>> postData<T>({
    String? token,
    required String endPoint,
    required dynamic data,
    String baseUrl = baseUrl,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    print(data);
    try {
      if (await checkInternet()) {
        return DataFailed(
          "No internet connection",
          statusCode: HttpStatus.serviceUnavailable,
        );
      }
      debugPrint('post body: ${json.encode(data)}');
      final response = await _client.post(
        Uri.parse(baseUrl + endPoint),
        headers: headers(),
        body: json.encode(data),
      );
      debugPrint('response: ${response.body}');
      return handleDataState(response: response, fromJson: fromJson);
    } catch (e) {
      debugPrint('Error: $e');
      return DataFailed(
        "unknown error",
        statusCode: HttpStatus.internalServerError,
      );
    }
  }

  Future<bool> checkInternet() async {
    return !(await _networkInfo.isConnected);
  }

  Future<DataState<T>> handleDataState<T>({
    required http.Response response,
    required fromJson,
  }) async {
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final object = fromJson(jsonData);
      return DataSuccess(object);
    } else {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      if (response.statusCode == 401) {
        CustomToast.showToast(
          message: 'Session has expired, please login.',
          backgroundColor: AppColor.redColor,
          fontSize: 15.sp,
          gravity: ToastGravity.BOTTOM,
          textColor: AppColor.whiteColor,
          toastDuration: 2,
        );
        box.erase();
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          AppRouter.loginScreen,
          (route) => false,
        );
      }
      return DataFailed(
        jsonData['message'] ?? 'unknown error',
        statusCode: response.statusCode,
      );
    }
  }

  Map<String, String> headers() {
    var headerMap = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      'lang': "en"
    };
    String? token = box.read('token');
    if (token != null && token.isNotEmpty) {
      headerMap[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    return headerMap;
  }
}
