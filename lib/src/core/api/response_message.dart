class Authorized {
  static const String badRequest =
      "Bad request, Try again later"; // failure, API rejected request
  static const String unauthorized =
      "User is unauthorized, Try again later"; // failure, user is not authorized
  static const String forbidden =
      "Forbidden request, Try again later"; //  failure, API rejected request
  static const String notFound =
      "Content not found, Try again later"; //  failure, API rejected request
  static const String internalServerError =
      "Something went wrong, Try again later"; // failure, crash in server side

  // local status code
  static const String connectTimeOut = "Time out error, Try again later";
  static const String cancel = "Request was cancelled, Try again later";
  static const String noInternetConnection =
      "Please check your internet connection, and try again";
  static const String unexpected = "Some thing went wrong, Try again later";

  static const String tooManyRequests =
      "Too many requests today, Try again later";
  static const String notSubscribed =
      "You are not subscribed, Subscribe now to download more videos.";
}
