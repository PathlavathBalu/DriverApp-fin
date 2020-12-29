
import 'package:driverapp/model/driverlist_model.dart';
import 'package:driverapp/ui/keypad/numpad.dart';
import 'package:driverapp/ui/keypad/numpad_controller.dart';
import 'package:flutter/material.dart';

class LoginScreen1 extends StatefulWidget {
  LoginScreen1({Key key}) : super(key: key);
  @override
  _LoginScreen1State createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
   // Initially password is obscure
  bool _obscureText = true;

  String _passCode;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  //final  String data =  
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    List<DriverList> _staffLIst = [];
  String staffListregion;
  TextEditingController passCode = TextEditingController();
 
  var _currencies = [
      "Please Select Driver",
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary",
  
  ];
  String _currentSelectedValue = 'Please Select Driver';

  NumPadController npc = NumPadController();
  @override
  void initState() {
    super.initState();
    // _staffLIst = API.driverList().then((result) {
    // syllabus = result.staffList;
    // });
    print("driver*****");
    /* Listener for the numpad controller. */
    npc.addListener(() {
      String realCode = "1111";
      if (npc.doneTyping) {
        if (realCode != npc.code) {
          npc.wrongInputBehavior();
        }
      }
    });
   // getChapter =  API.getChapter(null);
  }

  @override
  Widget build(BuildContext context) {
    // final json = JsonDecoder().convert(driverList());
    // _staffLIst = (json).map<DriverList>((item) => DriverList.fromJson(item)).toList();
    // staffListregion = _staffLIst[0].staffList[0].staffName;

    return Stack(children: [
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
        image: AssetImage("images/bg-image.png"),
        fit: BoxFit.cover,
      ))),
      Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: ListView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30,
                  ),
                  Icon(Icons.refresh, size: 20, color: Colors.white),
                ],
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              "images/logo.png",
              height: 200,
              width: 100,
            ),


// DropdownButtonFormField(
//    /// iconEnabledColor: Strings.themeColor,
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
//            // fontSize: Strings.fontSize
//            ),
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
//                        )),
//                 value: slb);
//           }).toList()
//         : Loader(),
//   ),
            

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                // height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey[400]),
                ),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
                          hintText: 'Please select expense',
                          border: InputBorder.none,
                        ),
                        isEmpty: _currentSelectedValue == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _currentSelectedValue,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _currentSelectedValue = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _currencies.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        
               SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey[400]),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 250,
              child: new TextFormField(
                controller: passCode,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Pass Code',
                    border: InputBorder.none,
                    icon: const Icon(Icons.qr_code_scanner_sharp, size: 20,)),
                validator: (val) => val.length < 8 ? 'Passcode too short.' : null,
                onSaved: (val) => _passCode = val,
                obscureText: _obscureText,
              ),
            ),
            new FlatButton(
                onPressed: _toggle,
                child: new Icon(_obscureText ? Icons.visibility_off : Icons.visibility))
          ],
        ),
      ),
                ),
              ),
            ),

      //       Center(
      //   child: new Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       DropdownButtonHideUnderline(
      //         child: new DropdownButton<String>(
      //           hint: new Text("Select Region"),
      //           value: staffListregion,
      //           isDense: true,
      //           onChanged: (String newValue) {
      //             setState(() {
      //               staffListregion = newValue;
      //             });
      //             print(staffListregion);
      //           },
      //           items: _staffLIst.map((DriverList map) {
      //             return new DropdownMenuItem<String>(
      //               value: map.staffList[0].staffId,
      //               child: new Text(map.staffList[0].staffName,
      //                   style: new TextStyle(color: Colors.black)),
      //             );
      //           }).toList(),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffec280e),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Color(0xffec280e)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 12),
                      child: InkWell(
                                   //onTap: () async {
                          // Navigator.of(context).push(new MaterialPageRoute(
                          //   builder: (BuildContext context) => new Home(),
                          // ));
                         
                       // driverList();
                        // API.deliveryDetail()
                        //             .then((result) async {
                        //           print("**********"+result.toString());
                        //             });

                     //   },
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  elevation: 16,
                                  child: Container(
                                    child: NumPad(
                                      controller: npc,
                                      pinInputLength: 9,
                                    ),
                                  ),
                                );
                              });
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Submit ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                              WidgetSpan(
                                child: Icon(Icons.keyboard_arrow_right,
                                    color: Colors.white, size: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]))
    ]);
  }
}
