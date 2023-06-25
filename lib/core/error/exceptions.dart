/// *** ParseException *** ///
class ParseException implements Exception {
  ParseException({String error = 'Parse Error'});
}

/// *** HandledException *** ///
class HandledException implements Exception {
  String error;

  HandledException({this.error = ''});
}

/// *** ServerException : HandledException *** ///
class ServerException extends HandledException {
  ServerException({String error = ''}) : super(error: error);
}

/// *** NullDataException : HandledException *** ///
class NullDataException extends ServerException {
  NullDataException({String error = ''}) : super(error: error);
}

/// *** UnauthorizedException : HandledException *** ///
class UnauthorizedException extends ServerException {
  UnauthorizedException({String error = ''}) : super(error: error);
}

/// *** UnprocessableEntityException : HandledException *** ///
class UnprocessableEntityException extends ServerException
    implements Exception {
  UnprocessableEntityException({String error = ''}) : super(error: error);
}

/// *** BadRequestException : HandledException *** ///
class BadRequestException extends ServerException {
  BadRequestException({String error = ''}) : super(error: error);
}

/// *** ForbiddenException : HandledException *** ///
class ForbiddenException extends ServerException {
  ForbiddenException({String error = ''}) : super(error: error);
}

/// *** NotFoundException : HandledException *** ///
class NotFoundException extends ServerException {
  NotFoundException({String error = ''}) : super(error: error);
}

/// *** InternalServerErrorException : HandledException *** ///
class InternalServerErrorException extends ServerException {
  InternalServerErrorException({String error = ''}) : super(error: error);
}

/// *** ServiceUnavailableException : HandledException *** ///
class ServiceUnavailableException extends ServerException {
  ServiceUnavailableException({String error = ''}) : super(error: error);
}

/// *** CacheException : HandledException *** ///
class CacheException extends HandledException {
  CacheException({String error = ""}) : super(error: error);
}

/// *** PickFileException : HandledException *** ///
class PickFileException extends HandledException {
  PickFileException({String error = ''}) : super(error: error);
}
