import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    _getStateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic DropDownList REST API'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(bottom: 100, top: 100),
            child: Text(
              'KDTechs',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
            ),
          ),
          //======================================================== State

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _myState,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select State'),
                        onChanged: (String newValue) {
                          setState(() {
                            _myState = newValue;
                            _getCitiesList();
                            print(_myState);
                          });
                        },
                        items: statesList?.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item['name']),
                                value: item['id'].toString(),
                              );
                            })?.toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        
          SizedBox(
            height: 30,
          ),

          //======================================================== City

          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _myCity,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select City'),
                        onChanged: (String newValue) {
                          setState(() {
                            _myCity = newValue;
                            print(_myCity);
                          });
                        },
                        items: citiesList?.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item['name']),
                                value: item['id'].toString(),
                              );
                            })?.toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
       
        ],
      ),
    );
  }

  //=============================================================================== Api Calling here

//CALLING STATE API HERE
// Get State information by API
  List statesList;
  String _myState;

  String stateInfoUrl = 'http://cleanions.bestweb.my/api/location/get_state';
  Future<String> _getStateList() async {
    await http.post(stateInfoUrl, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      "api_key": '25d55ad283aa400af464c76d713c07ad',
    }).then((response) {
      var data = json.decode(response.body);

//      print(data);
      setState(() {
        statesList = data['state'];
      });
    });
  }

  // Get State information by API
  List citiesList;
  String _myCity;

  String cityInfoUrl =
      'http://cleanions.bestweb.my/api/location/get_city_by_state_id';
  Future<String> _getCitiesList() async {
    await http.post(cityInfoUrl, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      "api_key": '25d55ad283aa400af464c76d713c07ad',
      "state_id": _myState,
    }).then((response) {
      var data = json.decode(response.body);

      setState(() {
        citiesList = data['cities'];
      });
    });
  }
}












// FutureBuilder(
//   future: provider.getsyllabus() ??
//       PostRestServices.getSyllabus(),
//   builder: (context, snapshot) {
//     List<Map<String, dynamic>> syllabus =
//         List();

//     switch (snapshot.connectionState) {
//       case ConnectionState.waiting:
//         syllabus = List();

//         // Loader();

//         break;

//       default:
//         if (snapshot.hasError) {
//           syllabus = List();

//           // return Handler(snapshot.error, reloadSyllabus);

//         }
//         if (snapshot.data.flags.flag == 2) {
//           syllabus = List();
//         }
//         // return ErrorCatcher(snapshot.data.flags.emsg);
//         else {
//           syllabus =
//               snapshot.data.mapExam.examLists;

//           if (provider.getsyllabus() == null) {
//             provider.setSyllabus(
//                 PostRestServices.getSyllabus());
//           }
//         }
//     }

//     return DropdownButtonFormField(
//       iconEnabledColor: Strings.themeColor,
//       icon: Icon(
//         Icons.keyboard_arrow_down,
//         size: 24,
//         color: Color(0xFF09557A),
//       ),

//       isExpanded: true,
//       hint: Padding(
//         padding:
//             const EdgeInsets.only(bottom: 5),
//         child: Text(
//           "Select Syllabus",
//           style: TextStyle(
//             color: Colors.grey,
//             fontSize: 10,
//           ),
//         ),
//       ),

//       // value: _to,
//       // hint: Text(_chooseOffice),
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.only(
//               bottom: 10, left: 5),
//           hintStyle: TextStyle(
//               color: Colors.grey,
//               fontSize: Strings.fontSize),
//           // hintText: "Syllabus Name",

//           enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(
//                   color: Colors.transparent))),

//       onChanged: (newValue) {
//         print(newValue);

//         exam.setExamId(newValue["examId"]);
//         examCatId = newValue["examCatId"];

//         // setState(() {
//         //   examId = newValue["examId"];
//         //   // getSubject = PostRestServices.getSubject(
//         //   //     newValue["examId"]);
//         // });
//       },
//       items: syllabus != null
//           ? syllabus.map<DropdownMenuItem>(
//               (Map<String, dynamic> slb) {
//               return DropdownMenuItem(
//                   child: Text(slb["examName"],
//                       style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: Strings
//                               .fontSize)),
//                   value: slb);
//             }).toList()
//           : Loader(),
//     );
//   }
//   ),