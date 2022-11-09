import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../log/log.dart';
import 'base_interceptor.dart';



final BaseHttp baseHttp = BaseHttp();

enum AuthStatus {valid,inValid}
///--> Base Http
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
  ///-------- INITIALIZATION -----------
  static String baseURL = "https://jsonplaceholder.typicode.com/";
  static int maxRedirects = 3;
  static final Dio _dio = Dio(BaseOptions(baseUrl: baseURL, maxRedirects: maxRedirects, receiveDataWhenStatusError: true));
  static initializeAPIServices() async {
    await _initializeStorage();
    await _interceptorsInitialization();
    await _listenToTokenChanges();
  }
  /// append an interceptor from here.
  /// all interceptors added in a row are executed one after another
  static appendInterceptor(InterceptorsWrapper interceptor) => _dio.interceptors.add(interceptor);


  static _interceptorsInitialization() {
    // TODO: add more interceptors here!
    _dio.interceptors.add(BaseInterceptor());
  }
  ///-------------------------------------

  // TOKEN FUNCTIONALITY
  static storeToken(String token) async {
    try {
      await _storage.write(_tokenStorageKey, token);
    } catch(e) {
      kLog("Error storing token!",tag: classTag,logStatus: LogStatus.ERROR);
    }
  }
  static String? getToken() {
    try {
      return _storage.read(_tokenStorageKey);
    } catch(e) {
      kLog("error getting token!",tag: classTag,logStatus: LogStatus.ERROR);
    }
    return null;
  }
  static clearCacheStorage() async {
    await _storage.write(_tokenStorageKey,_tokenNotFoundKey);
    await _storage.erase();
  }
  /// Listen to Auth Status.
  static final _authCheckResponse = StreamController<AuthStatus>();
 static void Function(AuthStatus) get _addAuthStatus => _authCheckResponse.sink.add;
  static Stream<AuthStatus> get getAuthenticationStream => _authCheckResponse.stream;
  static _listenToTokenChanges() async {
    if(!_storage.hasData(_tokenStorageKey)) await _storage.write(_tokenStorageKey,_tokenNotFoundKey);
    _storage.listenKey(_tokenStorageKey,(_) => checkAuthStatus());
  }
  static checkAuthStatus() => _addAuthStatus(_storage.read(_tokenStorageKey) != null && _storage.read(_tokenStorageKey) != _tokenNotFoundKey ? AuthStatus.valid : AuthStatus.inValid);
  // AUTH DATA FUNCTIONALITY
  static storeAuthData(Map<String,dynamic>? data) {try {_storage.write(_authDataStorageKey, data);} catch(e) {kLog("Error storing auth data!",tag: classTag,logStatus: LogStatus.ERROR);}}
  static getAuthData() {try {return _storage.read(_authDataStorageKey);} catch(e) {kLog("Error getting auth data!",tag: classTag,logStatus: LogStatus.ERROR);}return null;}
  // SET DEFAULT HEADERS
  static storeDefaultHeaders(Map<String,dynamic>? header) async {
    try {
      await _storage.write(_defaultHeadersStorageKey, header);
    } catch(e) {
      kLog("Error storing token!",tag: classTag,logStatus: LogStatus.ERROR);
    }
  }
  static getDefaultHeaders() {
    try {return _storage.read(_defaultHeadersStorageKey);
    } catch(e) {
      kLog("Error storing token!",tag: classTag,logStatus: LogStatus.ERROR);
    }
    return null;
  }

  Stream getStream({required String endPointURL,Map<String,dynamic>? queryParameters,Map<String,dynamic>? header,bool useCache = true}) async* {
    if(useCache && _storage.hasData(endPointURL)) yield _storage.read(endPointURL);
    Response response = await _dio.get(endPointURL,options: Options(headers: header),queryParameters: queryParameters);
    if(response.statusCode == 200) {
      if(useCache) _storage.write(endPointURL, response.data);
      yield response.data;
    } else {
      yield null;
    }
  }


  Future<dynamic> get({required String endPointURL,Map<String,dynamic>? queryParameters,Map<String,dynamic>? header,bool addToCache = true}) async {
    Response response = await _dio.get(endPointURL,options: Options(headers: header),queryParameters: queryParameters);
    if(response.statusCode == 200) {
      if(addToCache) _storage.write(endPointURL, response.data);
      return response.data;
    } else {
      return null;
    }
  }
  Future<dynamic> post({required String endPointURL,Map<String,dynamic>? data,Map<String,dynamic>? header,bool addToCache = true}) async {
    Response response = await _dio.post(endPointURL,data: data,options: Options(headers: header));
    if(response.statusCode == 200) {
      if(addToCache) _storage.write(endPointURL, response.data);
      return response.data;
    } else {
      return null;
    }
  }
}




