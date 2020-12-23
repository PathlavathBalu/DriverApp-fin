import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Color(0xffec280e),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: Row(
          children: [
            Container(
              width: 80,
            ),
            Text(
              'Order Details',
              style: TextStyle(
                  color: Colors.white, fontSize: 17, letterSpacing: 1),
            ),
          ],
        ),
      ),
      body: ListView(children: <Widget>[  
            DataTable(  
              
              columns: [  
                DataColumn(label: Text(  
                    'items',  
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)  
                )),  
                DataColumn(label: Text(  
                    'Qty',  
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)  
                )),  
                DataColumn(label: Text(  
                    'Price',  
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)  
                )),  
              ],  
              rows: [  
                DataRow(cells: [  
                  DataCell(
                    Container(
                      width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(height:8),
                        Text('Chicken Wrap(LARGE)', textScaleFactor: .8,),
                         SizedBox(height:5),
                         Text('+Wrap Chilly Sauce', textScaleFactor: .8,),
                      ],
                    )
                    )
                    ),  
                  DataCell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(height:8),
                        Text('2',textScaleFactor: .8,),
                         SizedBox(height:5),
                          Text('2',textScaleFactor: .8,),
                      ],
                    )
                    ),  
                  DataCell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(height:8),
                        Text('£20.00',textScaleFactor: .8,),
                         SizedBox(height:5),
                          Text('£3.00',textScaleFactor: .8,),
                      ],
                    )
                    ),  
                ]), 

                DataRow(cells: [  
                  DataCell(
                    Container(
                      width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:8),
                        Text('AJWAINIJHINGA(small)', textScaleFactor: .8,),
                         SizedBox(height:5),
                         Text('+Onions', textScaleFactor: .8,),
                      ],
                    )
                    )
                    ),  
                  DataCell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(height:8),
                        Text('4',textScaleFactor: .8,),
                         SizedBox(height:5),
                          Text('4',textScaleFactor: .8,),
                      ],
                    )
                    ),  
                  DataCell(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(height:8),
                        Text('£12.00',textScaleFactor: .8,),
                         SizedBox(height:5),
                          Text('£1.00',textScaleFactor: .8,),
                      ],
                    )
                    ),  
                ]),   
                DataRow(cells: [  
                  DataCell(Text('HARAMASALA TIKKA-A\n HOUSE SPECIALTY',textScaleFactor: .8)),  
                  DataCell(Text('5',textScaleFactor: .8)),  
                  DataCell(Text('£8.20',textScaleFactor: .8)),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('GILAFI SEEKH KEHBAB',textScaleFactor: .8)),  
                  DataCell(Text('2')),  
                  DataCell(Text('£7.90')),  
                ]),  
              ],  
            ), 
            Divider(color: Color(0xff676767),) ,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                     'Sub Total',
                     style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.w400
                     ),
                  ),
                  Text(
                    '£159.15',
                    style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.w400
                     ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                     'Delivery Charge',
                     style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.w400
                     ),
                  ),
                  Text(
                    '£3.60',
                    style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.w400
                     ),
                  )
                ],
              ),
            ),
            Divider(color: Color(0xff676767),) ,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                     'Sub Total',
                     style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.w400
                     ),
                  ),
                  Text(
                    '£162.75',
                    style: TextStyle(
                       fontSize: 17,
                       fontWeight: FontWeight.w400
                     ),
                  )
                ],
              ),
            ),
            Container(
             //  transform: Matrix4.translationValues(0.0, -90.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                       'Tax On Bill',
                       style: TextStyle(
                         fontSize: 17,
                         fontWeight: FontWeight.w400
                       ),
                    ),
                    Text(
                      '£0.00',
                      style: TextStyle(
                         fontSize: 17,
                         fontWeight: FontWeight.w400
                       ),
                    )
                  ],
                ),
              ),
            ),
          ]) ,
    );
  }
}