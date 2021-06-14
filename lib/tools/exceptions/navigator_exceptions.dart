class RouteNotFoundException implements Exception {
  String message;

  RouteNotFoundException(String route) {
    message = "The route \"$route\" not found";
  }
}