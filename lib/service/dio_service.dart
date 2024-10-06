import 'package:dio/dio.dart';
import 'package:exo_vr/util/log.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Http {
  static final _http = _config();

  static Dio _config() {
    final options = BaseOptions(
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      headers: _settingsHeader(),
    );
    final http = Dio(options);
    http.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          Log.http('${options.method} ${options.uri}');
          Log.http('${options.data}');
          final prefs = await SharedPreferences.getInstance();

          if (prefs.getInt('userId') != null) {
            options.headers['user_id'] = prefs.getInt('userId');
          }
          if (prefs.getString('token') != null) {
            options.headers['Authorization'] = prefs.getString('token');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          Log.http('RESPONSE: ${response.statusCode} ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) async {
          Log.http('ERROR RESPONSE: ${error.response?.statusCode} ${error.response?.data}');
          if (error.response?.statusCode == 401) {
            // providerContainer.read(messageProvider.notifier).setState(
            //       MessageState(
            //         code: error.response?.statusCode,
            //         title: error.type == DioExceptionType.connectionError
            //             ? 'Disculpe los inconvenientes.'
            //             : error.response?.data?['message']?.toString() ??
            //                 error.response?.data?['error']?.toString() ??
            //                 error.message?.toString() ??
            //                 error.response?.data?.toString(),
            //         type: MessageType.error,
            //       ),
            //     );
          } else {
            // providerContainer.read(messageProvider.notifier).setState(
            //       MessageState(
            //         code: error.response?.statusCode,
            //         title: error.response?.statusCode == 404
            //             ? 'Ocurrió un error al cargar la pagina. Por favor, vuelva a intentar más tarde.'
            //             : error.type == DioExceptionType.connectionError
            //                 ? 'Disculpe los inconvenientes.'
            //                 : error.response?.data?['message']?.toString() ??
            //                     error.response?.data?['error']?.toString() ??
            //                     error.message?.toString() ??
            //                     error.response?.data?.toString(),
            //         type: MessageType.error,
            //       ),
            //     );
          }

          return handler.next(error);
        },
      ),
    );
    return http;
  }

  static Map<String, dynamic> _settingsHeader() {
    final headers = {'Content-type': 'application/json; charset=utf-8'};
    return headers;
  }

  static Future<void> setHeader(String key, String value) async {
    final header = {
      key: value,
    };
    _http.options.headers.addAll(header);
  }

  static Future<dynamic> get(String url, {Map<String, dynamic>? queryParam}) async {
    final response = await _http.get(url, queryParameters: queryParam);
    return response;
  }

  static Future<dynamic> post(String url, {Map<String, dynamic>? queryParam, dynamic body}) async {
    final response = await _http.post(url, queryParameters: queryParam, data: body);
    return response;
  }

  static Future<dynamic> delete(String url, {dynamic body}) async {
    final response = await _http.delete(url, data: body);

    return response;
  }

  static Future<dynamic> put(String url, {dynamic body, FormData? data}) async {
    final response = await _http.put(url, data: body);
    return response;
  }
}
