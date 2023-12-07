import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:remote/constants/colors.dart';
import 'package:remote/constants/common_textstyles.dart';
import '../constants/strings.dart';
import 'appexception.dart';

FToast fToast = FToast();

RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    side: const BorderSide(color: lightGrey, width: 0.5));

BoxDecoration bottomBoxDecoration = BoxDecoration(
  shape: BoxShape.circle,
  color: Colors.white, // Set the background color inside the circle
  border: Border.all(
    color: Colors.blue, // Set the border color of the circle
    width: 3.0, // Set the border width
  ),
);

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case 201:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case 204:
      dynamic responseJson = jsonDecode('{}');
      return responseJson;
    case 400:
      // throw BadRequestException(
      //     jsonDecode(response.body)['message'] ?? response.body.toString());
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case 401:
    case 403:
      throw UnauthorisedException(
          'You are not authorised to view this. Please logout and login again.');
    case 500:
    default:
      throw FetchDataException('Error occurred while communication with server'
          ' with status code : ${response.statusCode}');
  }
}

Widget loading() => const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        color: darkBlue,
      ),
    );

Widget noDataFoundWidget() => const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "noDataFound",
      ),
    );

BoxDecoration boxDecoration = const BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      gradientColor4,
      gradientColor3,
      gradientColor2,
      gradientColor1,
    ],
  ),
);
