import 'package:driverapp/googlemap/googlemap.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff32106),
        leading: Container(
          width: 1,
        ),
        title: Center(
            child: Text(
          "Madhu Test",
          style: TextStyle(fontSize: 16),
        )),
        actions: [
          Center(
            child: Container(
              transform: Matrix4.translationValues(-50.0, 0.0, 0.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    // TextSpan(
                    //   text: "Madhu Test ",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.w500,
                    //   fontSize: 16
                    //   )
                    // ),
                    WidgetSpan(
                      child: Container(
                        width: 30,
                      ),
                    ),
                    WidgetSpan(
                      child: Icon(Icons.refresh, color: Colors.white, size: 22),
                    ),
                    WidgetSpan(
                      child: Container(
                        width: 30,
                      ),
                    ),
                    WidgetSpan(
                      child: Icon(Icons.power_settings_new,
                          color: Colors.white, size: 22),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              constraints: BoxConstraints.expand(height: 30),
              child: TabBar(
                  indicatorColor: Color(0xffc8c8c8),
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(
                          width: 90,
                        ),
                        child: Text(
                          "Out for delivery",
                          style: TextStyle(
                            color: Color(0xff8d8d8d),
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(width: 70),
                        child: Text(
                          "Delivered",
                          style: TextStyle(
                            color: Color(0xff8d8d8d),
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        // constraints: BoxConstraints.expand(width: 90),
                        child: Text(
                          "Commission Summary",
                          style: TextStyle(
                            color: Color(0xff8d8d8d),
                            fontFamily: 'Poppins',
                            //fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: Container(
                child: TabBarView(children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new GooglMap(),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '1.Order - D2',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                'Name : madhu',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                'Phone : 9876543210',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "Amount : 162.75",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "Payment : Paid",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "Status",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all()),
                                          child: Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: Text(
                                              '202 \nmin',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'EH127QD',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              '7.71 Miles',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(height: 40),
                                            Text(
                                              'Order Time',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              '15-12-2020',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              '07:11',
                                              //  textAlign: TextAlign.center ,
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new GooglMap(),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '1.Order - D1',
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                'Name : madhu',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                'Phone : 9876543210',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "Amount : 162.75",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "Payment : Paid",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                "Status",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all()),
                                          child: Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: Text(
                                              '202 \nmin',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'EH127QD',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              '7.71 Miles',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(height: 40),
                                            Text(
                                              'Order Time',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              '15-12-2020',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            Text(
                                              '07:11',
                                              //  textAlign: TextAlign.center ,
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1, vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('03-11-2020',
                                      style: TextStyle(
                                          //color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14)),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "Shift Start Time:",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14)),
                                        TextSpan(
                                            text: "08:36",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text('£0',
                                                style: TextStyle(
                                                    color: Color(0xffdf7a64),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 19)),
                                            SizedBox(height: 10),
                                            Text('Earnings',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14)),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('0',
                                                style: TextStyle(
                                                    color: Color(0xffdf7a64),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 19)),
                                            SizedBox(height: 20),
                                            Text('Delivered',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text('£0.00',
                                                style: TextStyle(
                                                    color: Color(0xffdf7a64),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 19)),
                                            SizedBox(height: 10),
                                            Text('Cash Due',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14)),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text('1',
                                                style: TextStyle(
                                                    color: Color(0xffdf7a64),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 19)),
                                            SizedBox(height: 10),
                                            Text('Remaining',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Card(
                              //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              elevation: 3,
                              //                          shape: RoundedRectangleBorder(
                              // borderRadius: BorderRadius.only(
                              //   bottomRight: Radius.circular(10),
                              //    topLeft: Radius.circular(10),
                              //     bottomLeft: Radius.circular(10),
                              //   topRight: Radius.circular(10)),
                              //   ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      color: Color(0xff0174a3),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Distance Travelled',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        '0.00 Miles',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'distance travelled for delivered order',
                                        style: TextStyle(
                                          //  color: Color(0xffdf7a64),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Card(
                              //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              elevation: 3,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      color: Color(0xff0174a3),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Float Amount',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        '£0.00',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'initial amount handed to deliver',
                                        style: TextStyle(
                                          //  color: Color(0xffdf7a64),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Card(
                              //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              elevation: 3,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      color: Color(0xff0174a3),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Cash Amount/ Orders',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        '£0.00 / 0',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'total Cash amount collected from POD',
                                        style: TextStyle(
                                          //  color: Color(0xffdf7a64),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Card(
                              //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              elevation: 3,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      color: Color(0xff0174a3),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Card Transactions/ Orders',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        '£0.00 / 0',
                                        style: TextStyle(
                                            color: Color(0xff000000),
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'initial amount handed to deliver',
                                        style: TextStyle(
                                          //  color: Color(0xffdf7a64),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
