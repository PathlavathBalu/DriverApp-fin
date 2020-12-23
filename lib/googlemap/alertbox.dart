import 'package:flutter/material.dart';

enum ConfirmAction { Cancel, Accept}  
Future<ConfirmAction> asyncConfirmDialog(BuildContext context) async {  
  return showDialog<ConfirmAction>(  
    context: context,  
    barrierDismissible: false, // user must tap button for close dialog!  
    builder: (BuildContext context) {  
      return AlertDialog(  
        title: Column(
          children: [
            Text(
              'Delivery',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,            
                ),
              ),
         SizedBox(height:10),
       Text(  
            'Order delivered',
             textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13          
            ),
            ), 
             SizedBox(height:10),
              Divider(color: Color(0xff676767),thickness: 0.5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(  
            child: const Text(
              'No',
              style: TextStyle(
                fontSize: 17,
                color: Colors.green,
               fontWeight: FontWeight.w500       
            ),
              ),  
            onTap: () {  
              Navigator.of(context).pop(ConfirmAction.Cancel);  
            },  
          ),
          Container(
            height: 30,
              child: VerticalDivider(
                color: Color(0xff676767),
              ),
          ) , 
          GestureDetector(  
            child: const Text(
              'Yes',
              style: TextStyle(
                  fontSize: 17,
               color: Color(0xffec280e),
               fontWeight: FontWeight.w500       
            ),
              ),  
            onTap: () {  
              Navigator.of(context).pop(ConfirmAction.Accept);  
            },  
          )  
            ],
          )
             ],
        ),   
         
      );  
    },  
  );  
}  