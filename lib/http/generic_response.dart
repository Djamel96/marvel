import 'dart:developer';

class GenericResponse {
  int? statusCode;
  bool success;
  String resCode;
  String successMessage;
  String errorMessage;
  var value;

  GenericResponse({
    this.statusCode,
    required this.resCode,
    required this.success,
    this.successMessage = "",
    this.errorMessage = "",
    this.value,
  });

  static defaultError({String? errorMessage, String? resCode}) =>
      GenericResponse(
          statusCode: 400,
          success: false,
          errorMessage: errorMessage ?? DEFAULT_ERROR_MESSAGE,
          resCode: resCode ?? DEFAUL_ERROR_CODE);

  static defaultSuccess({String? successMessage, var value}) => GenericResponse(
      statusCode: 200,
      success: true,
      successMessage: successMessage ?? "",
      resCode: DEFAULT_SUCCES_CODE,
      value: value);
}

const DEFAULT_SUCCES_CODE = "DEFAULT_SUCCES_CODE";
const DEFAUL_ERROR_CODE = "DEFAUL_ERROR";
const DEFAULT_ERROR_MESSAGE = "An error occured";

bool succesResponse(int? code) {
  log("****** status code = $code");
  if (code == null) return false;
  bool res = code >= 200 && code <= 301;
  log("succesResponse res = $res ");
  return res;
}
