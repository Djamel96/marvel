import 'dart:developer';
import 'package:dio/dio.dart';
import 'constants.dart';

Future<Response?> dioget(
    {required String url, Map<String, dynamic>? parameters}) async {
  Response response;
  Dio dio = Dio();
  var header = {
    "Accept": 'application/json',
    "Content-Type": "application/json"
  };

  try {
    response = await dio.get(url,
        options: Options(
            headers: header,
            sendTimeout: sendTimeOut,
            receiveTimeout: recieveTimeOut),
        queryParameters: parameters);
    return response;
  } on DioError catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.type == DioErrorType.connectTimeout) {
      return e.response;
    }
    if (e.response != null) {
      log(e.response?.statusCode.toString() ?? '');
      log("response = ${e.response?.data}");
      log(e.response?.headers.toString() ?? '');
      log(e.response?.requestOptions.toString() ?? '');
      return e.response;
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      log(e.requestOptions.toString());
      log(e.message);
      return e.response;
    }
  }
}
