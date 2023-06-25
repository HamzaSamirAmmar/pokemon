import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String error;

  const Failure(this.error, [List properties = const <dynamic>[]]);

  @override
  List<Object> get props => [error];
}

class ServerFailure extends Failure {
  const ServerFailure({String error = ""}) : super(error);
}

class CacheFailure extends Failure {
  const CacheFailure({String error = ""}) : super(error);
}

class ContactPickerFailure extends Failure {
  const ContactPickerFailure({String error = ""}) : super(error);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({String error = ""}) : super(error);
}
