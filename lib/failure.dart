
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
 final String message;
  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(String message) : super(message: message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message: message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message: message);
}

class HandshakeFailure extends Failure {
  const HandshakeFailure(String message) : super(message: message);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(String message) : super(message: message);
}

class DataFailure extends Failure {
  const DataFailure(String message) : super(message: message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message: message);
}

class NoServiceFoundFailure extends Failure {
  const NoServiceFoundFailure(String message) : super(message: message);
}

class InvalidFormatFailure extends Failure {
  const InvalidFormatFailure(String message) : super(message: message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(String message) : super(message: message);
}
