import 'package:flutter/material.dart';

errorBottomSheet(String msg,BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
            alignment: Alignment.center,
            height:50,
            color: Colors.red,
            child: Text(
              msg,
              style: TextStyle(color: Colors.white),
            )), 
      ),
    );
}

