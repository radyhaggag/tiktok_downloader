class ResponseMessage {
  static const String BAD_REQUEST =
      "Bad request, Try again later"; // failure, API rejected request
  static const String UNAUTHORISED =
      "User is unauthorised, Try again later"; // failure, user is not authorised
  static const String FORBIDDEN =
      "Forbidden request, Try again later"; //  failure, API rejected request
  static const String NOT_FOUND =
      "Content not found, Try again later"; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      "Something went wrong, Try again later"; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = "Time out error, Try again later";
  static const String CANCEL = "Request was cancelled, Try again later";
  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connection, and try again";
  static const String UNEXPECTED = "Some thing went wrong, Try again later";

  static const String TOO_MANY_REQUESTS =
      "Too many requests today, Try again later";
  static const String NOT_SUBSCRIBED =
      "You are not subscribed, Subscribe now to download more videos.";
}
