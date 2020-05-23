import 'package:dio/dio.dart';

mixin ApplicationConstants {
  static const baseUrl = "https://cognifeed.herokuapp.com/api";
  static Dio httpClient = Dio()
    ..options = BaseOptions(
      baseUrl: baseUrl,
      headers: {'Content-Type': 'application/json'},
    );
}
