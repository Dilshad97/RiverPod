import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('requesting');
    // do something before request is sent
    super.onRequest(options, handler); //add this line
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    //handler.next(dioError);
    print('done');
    // do something to error
    super.onError(dioError, handler); //add this line
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(response.statusCode);
    print('error');
    // do something before response
    super.onResponse(response, handler); //add this line
  }
}