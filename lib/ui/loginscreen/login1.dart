import 'package:driverapp/api/delivery.dart';
import 'package:driverapp/api/rest_services.dart';
import 'package:driverapp/ui/keypad/numpad.dart';
import 'package:driverapp/ui/keypad/numpad_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen1 extends StatefulWidget {
  final String authcode;
  final String devcode;
// final String staffId;
// final String passcode;

  // receive data from the FirstScreen as a parameter
  LoginScreen1(this.authcode, this.devcode);

  String staffId;

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
  List _staffList = [];
  TextEditingController passCode = TextEditingController();

  // var _currencies = [
  //     "Please Select Driver",
  //   "Food",
  //   "Transport",
  //   "Personal",
  //   "Shopping",
  //   "Medical",
  //   "Rent",
  //   "Movie",
  //   "Salary",

  // ];
  var _currentSelectedValue = '';

  var selectedVal;

  String staffId;

  NumPadController npc = NumPadController();
  @override
  void initState() {
    super.initState();

    getData();
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

  getData() async {
    await API.driverList(widget.authcode, widget.devcode).then((result) {
      print(result);

      setState(() {
        _staffList = result["staff_list"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
          image: AssetImage("images/bg-image.png"),
          fit: BoxFit.cover,
        ))),
      ),
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
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
                          hintText: 'Please select driver',
                          border: InputBorder.none,
                        ),
                        isFocused:
                            _currentSelectedValue == 'Please select driver',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: selectedVal,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                selectedVal = newValue;
                                _currentSelectedValue = newValue["staff_name"];
                                staffId = newValue["staff_id"];
                                state.didChange(newValue["staff_name"]);
                              });
                            },
                            items: _staffList.map((value) {
                              return DropdownMenuItem<Map<String, dynamic>>(
                                value: value,
                                child: Text(value["staff_name"]),
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
            SizedBox(
              height: 10,
            ),
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
                                icon: const Icon(
                                  Icons.qr_code_scanner_sharp,
                                  size: 20,
                                )),
                            // validator: (val) =>
                            //     val.length < 8 ? 'Passcode too short.' : null,
                            // onSaved: (val) => _passCode = val,
                            obscureText: _obscureText,
                          ),
                        ),
                        new FlatButton(
                            onPressed: _toggle,
                            child: new Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility))
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                        onTap: () {
                          loginAuthntication(widget.authcode, widget.devcode,
                                  staffId, passCode.text.trim())
                              .then((result) async {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            String customerDetails = preferences.getString(
                              "message",
                            );
                            print("*** customerDetail" + customerDetails);
                            // showDialog(
                            // context: context,
                            // builder: (context) {
                            //   return Dialog(
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(40)),
                            //     elevation: 16,
                            //     child: Container(
                            //       child: NumPad(
                            //         controller: npc,
                            //         pinInputLength: 9,
                            //       ),
                            //     ),
                            //   );
                            // });

                            String s = customerDetails;

                            if (s.contains("Correct")) {
                              print("lbiufgufuf" + customerDetails);
                              Fluttertoast.showToast(
                                  msg: customerDetails,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.blue,
                                  fontSize: 16.0);
                              print("Success");
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      elevation: 16,
                                      child: Container(
                                        child: NumPad(
                                          controller: npc,
                                          pinInputLength: 9,
                                        ),
                                      ),
                                    );
                                  });
                            } else {
                              Fluttertoast.showToast(
                                  msg: "customerDetails>>>else",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.blue,
                                  fontSize: 16.0);
                            }
                          });
                          // .then((result) async {
                          // SharedPreferences preferences =
                          //     await SharedPreferences.getInstance();

                          // String customerDetails = preferences.getString(
                          //   "message",
                          // );

                          //       print("*** customerDetail" + customerDetails);
                          // }

                          // showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return Dialog(
                          //         shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(40)),
                          //         elevation: 16,
                          //         child: Container(
                          //           child: NumPad(
                          //             controller: npc,
                          //             pinInputLength: 9,
                          //           ),
                          //         ),
                          //       );
                          //     });
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
