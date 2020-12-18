import 'package:flutter/material.dart';

class LoginScreen1 extends StatefulWidget {
  @override
  _LoginScreen1State createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];
    String _currentSelectedValue = 'Food';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
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
              // Text(
              //   "Driver App Settings",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 18,
              //   ),
              // ),
              Icon(
                Icons.refresh,
                size: 15,
              ),
              SizedBox(height:20),
              Image.asset("images/logo.png", height: 200, width: 100,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey[400]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.qr_code_scanner_sharp,
                              size: 20,
                            ),
                            border: InputBorder.none,
                            hintText: 'Authentication Code'
                          ),
                        ),
                  ),
                ),
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
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
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
              SizedBox(height:10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Container(width: 30,),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffec280e),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Color(0xffec280e)),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Submit ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              fontSize: 14
                              )
                            ),
                            WidgetSpan(
                              child: Icon(Icons.keyboard_arrow_right,color: Colors.white, size: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                      )
                  ],
                ),
              )
            ]))
      ]),
    );
  }
}
