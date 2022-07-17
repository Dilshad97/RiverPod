import 'package:dio/dio.dart';

import '../model/user.dart';

class ApiServices {
  final clientServices = ClientService();

  Future<List<Users>> getUser() async {
    Response? response;
    List<Users>? user;

    response = await clientServices.dio.get("/posts");
    var res = response.data as List;

    return res.map((e) => Users.fromJson(e)).toList();
  }

}

class ClientService {
  late Dio dio;
  String baseUrl = "https://jsonplaceholder.typicode.com";

  ClientService() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      // connectTimeout: 5000,
      // receiveTimeout: 3000,
      // responseType: ResponseType.json,
    ));
    dio.interceptors.add(ApiInterceptors());
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions requestOptions, RequestInterceptorHandler handler) {
    print("${requestOptions.method} ${requestOptions.path}");
    print(requestOptions.uri);
    super.onRequest(requestOptions, handler); //add this line
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    print(dioError.message);
    super.onError(dioError, handler); //add this line
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(response.statusCode);
    print(response.data);
    print(handler.isCompleted);
    // do something before response
    super.onResponse(response, handler); //add this line
  }
}
