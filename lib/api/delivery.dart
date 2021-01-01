// import 'dart:convert';
// import 'package:driverapp/model/driverlist_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as client;
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class API {
static Future<dynamic> driverList(String authcode, String devcode) async {
  Dio client = Dio();
  var responseJson;

  try {
    FormData formData = new FormData.fromMap({
        'auth_code': authcode,
      'device_code': devcode,
      'task': 'get_deliverydriver_list',
    
    });

    final response = await client.post(
      'https://www.uat.deveposhybrid.uk/index.php/webservices',
      data: formData,
    );
    print("driverList response.body" + formData.fields.toString());

    if (response.statusCode == 503) {
      throw Exception('Check your driverList connection');
    }

    if (response.statusCode == 200) {
      responseJson = jsonDecode( response.data) ;

     // print('api_provider driverList' + responseJson.toString());
      return responseJson;
    } else {
      throw Exception('Failed user ForgotPassword');
    }
  } catch (error) {
    if (error is SocketException) {
      throw Exception('Check your driverList connection');
    }
  }
}

// static Future<DriverList> driverList() async {
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


}


// DropdownButtonFormField(
//     iconEnabledColor: Strings.themeColor,
//     icon: Icon(
//       Icons.keyboard_arrow_down,
//       size: 24,
//       color: Color(0xFF09557A),
//     ),

//     isExpanded: true,
//     hint: Padding(
//       padding:
//           const EdgeInsets.only(bottom: 5),
//       child: Text(
//         "Select Syllabus",
//         style: TextStyle(
//           color: Colors.grey,
//           fontSize: 10,
//         ),
//       ),
//     ),

//     // value: _to,
//     // hint: Text(_chooseOffice),
//     decoration: InputDecoration(
//         contentPadding: EdgeInsets.only(
//             bottom: 10, left: 5),
//         hintStyle: TextStyle(
//             color: Colors.grey,
//             fontSize: Strings.fontSize),
//         // hintText: "Syllabus Name",

//         enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//                 color: Colors.transparent))),

//     onChanged: (newValue) {
//       print(newValue);

//       exam.setExamId(newValue["examId"]);
//       examCatId = newValue["examCatId"];

//       // setState(() {
//       //   examId = newValue["examId"];
//       //   // getSubject = PostRestServices.getSubject(
//       //   //     newValue["examId"]);
//       // });
//     },
//     items: syllabus != null
//         ? syllabus.map<DropdownMenuItem>(
//             (Map<String, dynamic> slb) {
//             return DropdownMenuItem(
//                 child: Text(slb["examName"],
//                     style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: Strings
//                             .fontSize)),
//                 value: slb);
//           }).toList()
//         : Loader(),
//   );