abstract class Failure {
  final String message;

  Failure(this.message);
}

class serverfailure extends Failure {
  serverfailure(String message) : super(message);
}

class networkfailure extends Failure {
  networkfailure(String message) : super(message);
}
