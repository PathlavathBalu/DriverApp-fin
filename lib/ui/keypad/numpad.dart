import 'package:driverapp/api/rest_services.dart';
import 'package:driverapp/ui/loginscreen/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart' as vector_math;
import 'package:flutter/services.dart';

import './pin_input_field.dart';
import './numpad_keyboard.dart';
import './numpad_controller.dart';

/* Numpad widget */
class NumPad extends StatefulWidget {
  final String authcode;
  final String devcode;
// final String staffId;
// final String passcode;

  // receive data from the FirstScreen as a parameter

  final TextEditingController pinInputController = TextEditingController();
  TextEditingController floatAmount = TextEditingController();

  /* Constructor Parameters. */
  final NumPadController controller;

  final backgroundColor, keyColor, clearKeyBackgroundColor;
  final backKeyBackgroundColor, pinInputFieldColor, numPadFontColor;
  final backKeyFontColor, clearKeyFontColor, pinPlaceholderColor;

  final int pinInputLength, keyFont; // Limit how many characters can be typed.
  final String pinPlaceholder;

  NumPad({
    @required this.controller,
    this.authcode,
    this.devcode,
    this.backgroundColor = Colors.white,
    this.keyColor = Colors.black26,
    this.keyFont,
    this.clearKeyBackgroundColor = Colors.black38,
    this.clearKeyFontColor = Colors.white,
    this.backKeyBackgroundColor = Colors.black38,
    this.backKeyFontColor = Colors.white,
    this.numPadFontColor = Colors.white,
    this.pinInputFieldColor = Colors.black,
    this.pinInputLength = 9,
    this.pinPlaceholder = "",
    this.pinPlaceholderColor,
  });

  @override
  _NumPadState createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  TextEditingController inputController;
  /* Listeners */
  Function inputControllerListener,
      animControllerListener,
      animationStatusListener;

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    animationController.removeListener(animControllerListener);
    inputController.removeListener(inputControllerListener);
    //animation.removeListener(animationStatusListener);
    super.dispose();
  }

  @override
  void initState() {
    print("initializing numpad");
    super.initState();
    
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    int pinInputLength = widget.pinInputLength;
    inputController = widget.pinInputController;

    /* Listeners defs. */
    inputControllerListener = () {
      widget.controller.code = inputController.text;
      if (inputController.text.length >= pinInputLength) {
        widget.controller.doneTyping = true;
      }
    };
    animControllerListener = () => setState(() {});
    animationStatusListener = (AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        widget.controller.doneTyping = false;

        animationController.reset();
        widget.pinInputController.clear();

        widget.controller.code = widget.pinInputController.text;
      }
    };
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..addListener(animControllerListener);
    animation = Tween<double>(
      begin: -10.0,
      end: 10.0,
    ).animate(animationController)
      ..addStatusListener(animationStatusListener);
    inputController.addListener(inputControllerListener);

    NumPadController.shakeAnimation = animationController;
  }

  vector_math.Vector3 _shake() {
    double progress = animationController.value;
    double offset = sin(progress * pi * 800000.0);
    offset = double.parse(offset.toStringAsFixed(2));

    return vector_math.Vector3(offset * 10, 0.0, 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.backgroundColor,
        body: Container(
            /* Input text field at the top where the PIN input is displayed. */
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: ListenableProvider<TextEditingController>.value(
                    value: widget.pinInputController,
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /* Pin Input Field Container */
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            ' Float Amount',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 65),
                          child: Container(
                              //height: 20,

                              child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                            child: Provider<vector_math.Vector3>.value(
                                value: _shake(),
                                child: PinInputField(
                                  placeholder: widget.pinPlaceholder,
                                  placeholderColor: widget.pinPlaceholderColor,
                                  color: widget.pinInputFieldColor,
                                )),
                          )),
                        ),
                        /* Numpad Keyboard Container. */
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: NumPadKeyboard(
                            keyFont: widget.keyFont,
                            keyColor: widget.keyColor,
                            clearKeyBackgroundColor:
                                widget.clearKeyBackgroundColor,
                            backKeyBackgroundColor:
                                widget.backKeyBackgroundColor,
                            backKeyFontColor: widget.backKeyFontColor,
                            clearKeyFontColor: widget.clearKeyFontColor,
                            keyFontColor: widget.numPadFontColor,
                            pinInputController: widget.pinInputController,
                            pinInputLength: widget.pinInputLength,
                            numPadController: widget.controller,
                          ),
                        ),
                        SizedBox(height: 25),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffec280e),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Color(0xffec280e)),
                            ),
                            child: FlatButton(
                              onPressed: () {
                                 fetchData();
     print("*******Dayta"+fetchData().toString());
                                // fetchWritingDetails();
                                // print("sddssd"+fetchWritingDetails().toString());
                                // Navigator.of(context)
                                //     .push(new MaterialPageRoute(
                                //   builder: (BuildContext context) => new Home(),
                                // ));
                                //   
                               // floatAmount();

                                // floatAmount().then((result) async {
                                //   SharedPreferences preferences =
                                //       await SharedPreferences.getInstance();
                                //   String floatamount = preferences.getString(
                                //     "float",
                                //   );
                                //   print("*** customerDetail" + floatamount);

                                //   String s = floatamount;

                                //   if (s.contains("Inserted into table")) {
                                //     print("lbiufgufuf" + floatamount);
                                //     Fluttertoast.showToast(
                                //         msg: floatamount,
                                //         toastLength: Toast.LENGTH_SHORT,
                                //         gravity: ToastGravity.CENTER,
                                //         timeInSecForIosWeb: 1,
                                //         backgroundColor: Colors.black,
                                //         textColor: Colors.blue,
                                //         fontSize: 16.0);
                                //     print("Success");
                                //     Navigator.of(context)
                                //         .push(new MaterialPageRoute(
                                //       builder: (BuildContext context) =>
                                //           new Home(),
                                //     ));
                                //   } else {
                                //     Fluttertoast.showToast(
                                //         msg: "floatamount>>>else",
                                //         toastLength: Toast.LENGTH_SHORT,
                                //         gravity: ToastGravity.CENTER,
                                //         timeInSecForIosWeb: 1,
                                //         backgroundColor: Colors.black,
                                //         textColor: Colors.blue,
                                //         fontSize: 16.0);
                                //   }
                                // });
                               
                               },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))))));
  }
}
