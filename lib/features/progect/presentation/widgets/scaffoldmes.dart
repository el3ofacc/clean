import 'package:flutter/material.dart';
class Scaffoldmes {
static    showmessage(String message, BuildContext context) {
 
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'))
            ],
          ));
}  
}
//-------------------------------------------------------
showmessage(String message, BuildContext context) {
 
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'))
            ],
          ));
}  