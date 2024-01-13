import 'package:dio/dio.dart';
import 'package:uleaning_app_bloc/common/values/constant.dart';
import 'package:uleaning_app_bloc/global.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);
    dio = Dio(options);
  }

  Future post(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers??{};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if(authorization!=null){
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions
    );
    return response.data;
  }

  Map<String, dynamic>? getAuthorizationHeader(){
    var headers= <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if(accessToken.isNotEmpty){
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }
}
