// abstract class Failure {
//   final String message;

//   Failure(this.message);
// }

// class serverfailure extends Failure {
//   serverfailure(String message) : super(message);
// }

// class networkfailure extends Failure {
//   networkfailure(String message) : super(message);
// }

 

import 'package:flutter/widgets.dart';

abstract class Failure {
  String message;
  Failure(this.message);
}

class Networkfailure extends Failure {
  Networkfailure(String message) : super(message);
}

class serverfailure extends Failure {
  serverfailure(String message) : super(message);
}
