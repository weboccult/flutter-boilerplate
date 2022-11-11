import 'package:dio/dio.dart';
import '../log/log.dart';
import 'base_http.dart';

///[
///BaseHttp] Base-Interceptor.
///
/// Handle your errors, auth-check and more of your http requests here!
///
class BaseInterceptor implements InterceptorsWrapper {

  ///Set basic headers of your application with custom token and fields here!
  ///
  /// [BaseHttp] default headers can also be used.
  getHeaders() {
    var headers = <String, String>{'Content-Type': 'application/json'};
    String? token = BaseHttp.getToken();
    if(token != null) {
      headers['Authorization'] =  "bearer " '$token';
    }
    return headers;
  }

  ///error handler of [BaseHttp].
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    kLog("onError Interceptor $err");

    handler.next(err);
  }


  ///request handler of [BaseHttp].
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    kLog("onRequest Interceptor ${options.uri}");

    options.headers = getHeaders();
    handler.next(options);
  }


  ///response handler of [BaseHttp].
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    kLog("onResponse Interceptor ${response.data}");

    handler.next(response);
  }
}