import 'dart:convert';
import 'dart:io';import 'package:dio/dio.dart';
import 'package:driverapp/model/login_model.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Feedback> Login(String authCode, String deviceCode) async {
Dio client = Dio();
var responseJson;
SharedPreferences  sharedPreferences;

try {
FormData formData = new FormData.fromMap({
'device_code': deviceCode,
'task': "app_authentication",
'app_name': "15",
'auth_code': authCode,
});

final response = await client.post(
'https://www.uat.deveposhybrid.uk/index.php/webservices',
data: formData,
);
print("suggestions response.body" + formData.fields.toString());
responseJson = json.decode(response.toString());
if (response.statusCode == 503) {
throw Exception('Check your internet or wi-fi connection');
}

if (response.statusCode == 200) {


print('api_provider suggestions responseJson==' +
responseJson.toString());


 sharedPreferences = await SharedPreferences.getInstance();
    Map decode_options = jsonDecode(response.toString());
            String user = jsonEncode(LoginModel.fromJson(decode_options));
            sharedPreferences.setString('user', user);
            print('user' +user) ;
    
} else {
throw Exception('Failed user ForgotPassword');
}
} catch (error) {
if (error is SocketException) {
throw Exception('Check your internet or wi-fi connection');
}
}
}