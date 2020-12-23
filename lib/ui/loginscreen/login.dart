import 'package:driverapp/ui/loginscreen/login1.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
                     keyboardType: TextInputType.number,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey[400]),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.qr_code,
                            size: 20,
                          ),
                          border: InputBorder.none,
                          hintText: 'Device Code'
                        ),
                      ),
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
                  child:InkWell(
                     onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new LoginScreen1(),
              ));
            },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Submit ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              fontSize: 15
                              )
                            ),
                            WidgetSpan(
                              child: Icon(Icons.keyboard_arrow_right,color: Colors.white, size: 17),
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
