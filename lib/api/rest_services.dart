import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:driverapp/model/loginAuth.dart';
import 'package:driverapp/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<LoginModel> Login(String authCode, String deviceCode) async {
  Dio client = Dio();
  var responseJson;
  SharedPreferences sharedPreferences;

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
      print(
          'api_provider suggestions responseJson==' + responseJson.toString());

      sharedPreferences = await SharedPreferences.getInstance();
      Map decode_options = jsonDecode(response.toString());
      String user = jsonEncode(LoginModel.fromJson(decode_options));
      sharedPreferences.setString('user', user);
      print('user' + user);
    } else {
      throw Exception('Failed user ForgotPassword');
    }
  } catch (error) {
    if (error is SocketException) {
      throw Exception('Check your internet or wi-fi connection');
    }
  }
}


Future<LoginAuth> loginAuthntication(String authCode, String deviceCode, String staffId, String passcode) async {
  Dio client = Dio();
  var responseJson;
  SharedPreferences sharedPreferences;

  try {
    FormData formData = new FormData.fromMap({
      'device_code': deviceCode,
      'task': 'login_authentication',
      'app_name': 'driver',
      'staff_id': staffId,
      'auth_code': authCode,
      'password': passcode
    });

    final response = await client.post(
      'https://www.uat.deveposhybrid.uk/index.php/webservices',
      data: formData,
    );
    print("biuguigigg response.body" + formData.fields.toString());
    
  
    if (response.statusCode == 503) {
      throw Exception('Check your LoginAuthntcation');
    }

    if (response.statusCode == 200) {
    print("response.statusCode == 200" + response.statusCode.toString());
responseJson = json.decode(response.toString());
      print(
          'api_provider LoginAuthntcation responseJson==' + responseJson.toString());

      sharedPreferences = await SharedPreferences.getInstance();
      Map login_auth = jsonDecode(response.toString());
      String message = jsonEncode(LoginAuth.fromJson(login_auth));
      sharedPreferences.setString('message', message);
      print('message' + message);
    } else {
      throw Exception('Failed message LoginAuthntcation');
    }
  } catch (error) {
    if (error is SocketException) {
      throw Exception('Check your internet LoginAuthntcation');
    }
  }
}



Future<dynamic> floatAmount() async {
    Dio client = Dio();
  var floatAmnt;
  SharedPreferences sharedPreferences;

  try {
    FormData formData = new FormData.fromMap({
      'device_code': '6635',
      'task': 'driver_float_amount',
      'app_name': 'driver',
      'staff_id': '68',
      'auth_code': 'HZFAYW',
      'float_amount' : '40',
    });

    final response = await client.post(
      'https://www.uat.deveposhybrid.uk/index.php/webservices',
      data: formData,
    );
    print("suggestions response.body" + formData.fields.toString());
    floatAmnt = json.decode(response.toString());
    if (response.statusCode == 503) {
      throw Exception('Check your Float Amount');
    }

    if (response.statusCode == 200) {
      print(
          'api_provider Float Amount response==' + floatAmnt.toString());

      sharedPreferences = await SharedPreferences.getInstance();
      Map float_amount = jsonDecode(response.toString());
      String float = jsonEncode(LoginAuth.fromJson(float_amount));
      sharedPreferences.setString('float', float);
      print('float' + float);
    } else {
      throw Exception('Failed float Amount');
    }
  } catch (error) {
    if (error is SocketException) {
      throw Exception('Check your floatAmnt');
    }
  }
}


// Future<List<DriverList>> driverDetail() async {
//   Dio client = Dio();
//   var responseJson;

//   try {
//     FormData formData = new FormData.fromMap({
//       'device_code': '6618',
//       'task': 'get_deliverydriver_list',
//       'auth_code': "HZFAYW",
//     });

//     final response = await client.post(
//       'https://www.uat.deveposhybrid.uk/index.php/webservices',
//       data: formData,
//     );
//     print("driverList response.body" + formData.fields.toString());

//     if (response.statusCode == 503) {
//       throw Exception('Check your driverList connection');
//     }

//     if (response.statusCode == 200) {
//       responseJson = json.decode(response.toString());

//      // print('api_provider driverList' + responseJson.toString());
//       return responseJson;
//     } else {
//       throw Exception('Failed user ForgotPassword');
//     }
//   } catch (error) {
//     if (error is SocketException) {
//       throw Exception('Check your driverList connection');
//     }
//   }
  
// }
