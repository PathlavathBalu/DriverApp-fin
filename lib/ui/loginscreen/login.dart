import 'package:driverapp/api/rest_services.dart';
import 'package:driverapp/ui/loginscreen/login1.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String authCode;
  String deviceCode;

  void customerDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString("customerDetail");
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController devCode = TextEditingController();
  TextEditingController autCode = TextEditingController();
  @override
  void initState() {
    // Login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            Text(
              "Driver App Settings",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            // SizedBox(height:10),
            Image.asset(
              "images/logo.png",
              height: 200,
              width: 100,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey[400]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: autCode,
                          // keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.qr_code_scanner_sharp,
                                size: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'Authentication Code'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Authentication Code is Required';
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            authCode = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey[400]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: devCode,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.qr_code,
                                size: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'Device Code'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Device Code is Required';
                            }

                            return null;
                          },
                          onSaved: (String value) {
                            deviceCode = value;
                          },
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
                          child: InkWell(
                            onTap: () {
                              Login(autCode.text.trim(), devCode.text.trim())
                                  .then((result) async {
                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();

                                String customerDetails = preferences.getString(
                                  "user",
                                );
                                print("*** customerDetail" + customerDetails);
                                if (customerDetails == null) {
                                  print("Server Error");
                                } else if (customerDetails
                                    .toLowerCase()
                                    .contains("1")) {
                                  Fluttertoast.showToast(
                                      msg: "Login Sucess",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.blue,
                                      fontSize: 16.0);
                                  print("Success");
                                  Navigator.of(context)
                                      .push(new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new LoginScreen1(),
                                  ));
                                } else if (customerDetails
                                    .toLowerCase()
                                    .contains("2")) {
                                  if (autCode.text.trim().isNotEmpty &&
                                      devCode.text.trim().isNotEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Invalid Authcode",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.blue,
                                        fontSize: 16.0);
                                  } else {
                                    print("Invalid Authcode");
                                    Fluttertoast.showToast(
                                        msg: "Invalid Authcode",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.blue,
                                        fontSize: 16.0);
                                  }
                                } else if (customerDetails
                                    .toLowerCase()
                                    .contains("3")) {
                                  if (autCode.text.trim().isNotEmpty &&
                                      devCode.text.trim().isNotEmpty) {
                                    print("3");
                                    Fluttertoast.showToast(
                                        msg: "Invalid deviceCode",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.blue,
                                        fontSize: 16.0);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Invalid data",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.blue,
                                        fontSize: 16.0);
                                  }
                                  print("Invalid device code");
                                } else if (customerDetails
                                    .toLowerCase()
                                    .contains("4")) {
                                  Fluttertoast.showToast(
                                      msg: "Already used this device",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.blue,
                                      fontSize: 16.0);
                                  print("Already used this device");
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Faild to verify",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.blue,
                                      fontSize: 16.0);
                                  print("ok");
                                }
                                print("autCode.text.trim()" +
                                    autCode.text.trim());

                                print("devCode.text.trim()" +
                                    devCode.text.trim());
                              });
                              Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new LoginScreen1(),
                              ));

                              //print("*****************");
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 12),
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
                ],
              ),
            )
          ]))
    ]);
  }
}
