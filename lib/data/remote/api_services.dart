import 'package:dio/dio.dart';

class APIService {
  static final Dio _dio = Dio();

  static const String baseUrl = 'https://hacker-news.firebaseio.com/v0';

  /// GET rest API call
  /// Used to get data from backend
  ///
  /// Use [forcedBaseUrl] when want to use specific baseurl other
  /// than configured
  ///
  /// The updated data to be passed in [data]
  ///
  /// [params] are query parameters
  ///
  /// [path] is the part of the path after the base URL
  ///
  /// set [encrypt] to true if the body needs to be encrypted. Make sure the
  /// encryption keys in the backend matches with the one in frontend
  static Future<Response<Map<String, dynamic>?>> get({
    required String path,
    Map<String, dynamic>? params,
    bool encrypt = true,
    String? forcedBaseUrl,
  }) async {
    return _dio.get<Map<String, dynamic>?>(
      baseUrl + path,
      queryParameters: params,
      options: Options(headers: <String, dynamic>{
        'encrypt': encrypt,
      }),
    );
  }

  static Future<Response<List<dynamic>?>> getList({
    required String path,
    Map<String, dynamic>? params,
    bool encrypt = true,
    String? forcedBaseUrl,
  }) async {
    return _dio.get<List<dynamic>?>(
      baseUrl + path,
      queryParameters: params,
      options: Options(headers: <String, dynamic>{
        'encrypt': encrypt,
      }),
    );
  }

  /// POST rest API call
  /// Used to send any data to server and get a response
  ///
  /// Use [forcedBaseUrl] when want to use specific baseurl other
  /// than configured
  ///
  /// The updated data to be passed in [data]
  ///
  /// [params] are query parameters
  ///
  /// [path] is the part of the path after the base URL
  ///
  /// set [encrypt] to true if the body needs to be encrypted. Make sure the
  /// encryption keys in the backend matches with the one in frontend
  static Future<Response<Map<String, dynamic>?>?> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? params,
    Options? options,
    bool encrypt = true,
    String? forcedBaseUrl,
  }) async =>
      _dio.post<Map<String, dynamic>?>(
        baseUrl + path,
        data: data,
        queryParameters: params,
        options: options ??
            Options(headers: <String, dynamic>{
              'encrypt': encrypt,
              'Content-Type': 'application/json; charset=UTF-8',
            }),
      );
}
