import 'package:dio/dio.dart';

import '../log/log.dart';
import 'base_http.dart';

///--> Interceptor
class BaseInterceptor implements InterceptorsWrapper {



  getHeaders() {
    var headers = <String, String>{'Content-Type': 'application/json'};
    String? token = BaseHttp.getToken();
    if(token != null) {
      headers['Authorization'] =  "bearer " '$token';
    }
    return headers;
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError

    kLog("onError Interceptor $err");
    kLog("onError Interceptor ${err.message}");
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    kLog("onRequest Interceptor ${options.uri}");
    // TODO: implement onRequest

    options.headers = getHeaders();
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    kLog("onResponse Interceptor ${response.data}");
    // TODO: implement onResponse

    handler.next(response);
  }
}