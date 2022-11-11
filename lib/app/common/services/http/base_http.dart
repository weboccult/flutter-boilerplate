import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../log/log.dart';
import 'base_interceptor.dart';

/// Single instance of base http.
final BaseHttp baseHttp = BaseHttp();

/// Authentication status.
enum AuthStatus { valid, inValid }

/// Base Http service file.
///
///=> It contains all the basic required things for calling apis.
///
///=> It also contains http cache data storage using [GetStorage]
///
///=> All Authentication Services are also included. i.e :- Storing auth_data,token. Using Interceptors. declaring base api.
///
class BaseHttp {
  //---> Singleton Creation
  static final BaseHttp _service = BaseHttp._internal();
  factory BaseHttp() => _service;
  BaseHttp._internal();
  static const classTag = "BaseHTTP";

  ///---------- Storage -------------------
  static GetStorage get apiCacheStorage => _storage;
  static final GetStorage _storage = GetStorage('api_cache_container');
  static bool isStorageReady = false;
  static const _tokenStorageKey = "authentication_token";
  static const _tokenNotFoundKey = "TOKEN_DELETED";
  static const _authDataStorageKey = "authentication_data";
  static const _defaultHeadersStorageKey = "api_headers";
  static _initializeStorage() async {
    ///Storage Initialization
    isStorageReady = false;
    try {
      await GetStorage.init('api_cache_container').then((r) => (r) {
            isStorageReady = true;
          });
    } catch (e) {
      kLog("error in api cache initialization..", logStatus: LogStatus.ERROR, tag: classTag);
    }
  }

  /// Set BASE-URL here!!
  static String baseURL = "";

  /// Set MAX-REDIRECTS here!!
  static int maxRedirects = 3;
  static final Dio _dio = Dio(BaseOptions(baseUrl: baseURL, maxRedirects: maxRedirects, receiveDataWhenStatusError: true));

  ///Initialization of API services[BaseHttp]
  ///
  /// It includes following things.
  ///
  /// => Initialization of Http Cache Storage ('api_cache_container')
  ///
  /// => Base Interceptor [BaseInterceptor] Initialization.
  ///
  /// => Listen to Auth Status Token Changes.
  static initializeAPIServices() async {
    await _initializeStorage();
    await _interceptorsInitialization();
    await _listenToTokenChanges();
  }

  /// append an interceptor from here.
  /// all interceptors added in a row are executed one after another.
  static appendInterceptor(InterceptorsWrapper interceptor) => _dio.interceptors.add(interceptor);
  static _interceptorsInitialization() {
    ///add more interceptors here!
    _dio.interceptors.add(BaseInterceptor());
  }

  /// Store Token Functionality.
  ///
  ///Token is used to verify authentication status in the app.
  ///If storage has stored_token then authentication status is VALID ([AuthStatus.valid])
  ///and if there is no token authentication status is INVALID ([AuthStatus.inValid]).
  ///
  /// Always use [BaseHttp] [clearCacheStorage] function when you need to clear token or make authentication status [AuthStatus.inValid]\
  ///
  static storeToken(String token) async {
    try {
      await _storage.write(_tokenStorageKey, token);
    } catch (e) {
      kLog("Error storing token!", tag: classTag, logStatus: LogStatus.ERROR);
    }
  }

  /// Get value of Stored Token.
  ///
  /// returns [null] if no token is found.
  ///
  static String? getToken() {
    try {
      return _storage.read(_tokenStorageKey);
    } catch (e) {
      kLog("error getting token!", tag: classTag, logStatus: LogStatus.ERROR);
    }
    return null;
  }

  /// Clears the [apiCacheStorage] and clears the Stored Token.
  ///
  static clearCacheStorage() async {
    await _storage.write(_tokenStorageKey, _tokenNotFoundKey);
    await _storage.erase();
  }

  static final _authCheckResponse = StreamController<AuthStatus>();
  static void Function(AuthStatus) get _addAuthStatus => _authCheckResponse.sink.add;

  ///
  /// Listen to Auth Status Stream.
  ///
  static Stream<AuthStatus> get getAuthenticationStream => _authCheckResponse.stream;

  ///
  /// Closes the auth status_check.
  ///
  /// Call this function on application close.
  static closeAuthStatusResponse() => _authCheckResponse.close();

  static _listenToTokenChanges() async {
    if (!_storage.hasData(_tokenStorageKey)) await _storage.write(_tokenStorageKey, _tokenNotFoundKey);
    _storage.listenKey(_tokenStorageKey, (_) => checkAuthStatus());
  }

  /// Check authentication status.
  static checkAuthStatus() => _addAuthStatus(_storage.read(_tokenStorageKey) != null && _storage.read(_tokenStorageKey) != _tokenNotFoundKey ? AuthStatus.valid : AuthStatus.inValid);

  ///Store authentication data in [apiCacheStorage].
  static storeAuthData(Map<String, dynamic>? data) {
    try {
      _storage.write(_authDataStorageKey, data);
    } catch (e) {
      kLog("Error storing auth data!", tag: classTag, logStatus: LogStatus.ERROR);
    }
  }

  ///Get authentication data in [apiCacheStorage].
  static getAuthData() {
    try {
      return _storage.read(_authDataStorageKey);
    } catch (e) {
      kLog("Error getting auth data!", tag: classTag, logStatus: LogStatus.ERROR);
    }
    return null;
  }

  ///Store Default Headers for HTTP Requests.
  ///
  /// This function will only store the headers in [apiCacheStorage].
  static storeDefaultHeaders(Map<String, dynamic>? header) async {
    try {
      await _storage.write(_defaultHeadersStorageKey, header);
    } catch (e) {
      kLog("Error storing token!", tag: classTag, logStatus: LogStatus.ERROR);
    }
  }

  /// Get Default Headers for HTTP Requests.
  ///
  /// This function returns the stored header in [apiCacheStorage].
  static getDefaultHeaders() {
    try {
      return _storage.read(_defaultHeadersStorageKey);
    } catch (e) {
      kLog("Error storing token!", tag: classTag, logStatus: LogStatus.ERROR);
    }
    return null;
  }

  /// get request in form of stream.
  ///
  /// NOTE: Still in development.
  ///
  /// A [StreamBuilder] Widget can be used to get this data. first it will return the cache data and then the response data.
  ///
  Stream getStream({required String endPointURL, Map<String, dynamic>? queryParameters, Map<String, dynamic>? header, bool useCache = true}) async* {
    if (useCache && _storage.hasData(endPointURL)) yield _storage.read(endPointURL);
    Response response = await _dio.get(endPointURL, options: Options(headers: header), queryParameters: queryParameters);
    if (response.statusCode == 200) {
      if (useCache) _storage.write(endPointURL, response.data);
      yield response.data;
    } else {
      yield null;
    }
  }

  /// Base HTTP get request.
  ///
  /// By default it will store data in [apiCacheStorage] with [endPointURL] as Storage Key.
  Future<T?> get<T>({required String endPointURL, Map<String, dynamic>? queryParameters, Map<String, dynamic>? header, bool addToCache = true}) async {
    Response response = await _dio.get(endPointURL, options: Options(headers: header), queryParameters: queryParameters);
    if (response.statusCode == 200) {
      if (addToCache) _storage.write(endPointURL, response.data);
      return response.data;
    } else {
      return null;
    }
  }

  /// Base HTTP post request.
  ///
  /// By default it will store data in [apiCacheStorage] with [endPointURL] as Storage Key.
  Future<T?> post<T>({required String endPointURL, Map<String, dynamic>? data, Map<String, dynamic>? header, bool addToCache = true}) async {
    Response response = await _dio.post(endPointURL, data: data, options: Options(headers: header));
    if (response.statusCode == 200) {
      if (addToCache) _storage.write(endPointURL, response.data);
      return response.data;
    } else {
      return null;
    }
  }
}
