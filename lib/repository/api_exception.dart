// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../common/app_config.dart';
import '../helper/logout_helper.dart';
import 'error_model.dart';
import 'error_string.dart';

class AppApiException implements Exception {
  ErrorStrings error = ErrorStrings();
  ErrorModel _errorModel = ErrorModel();
  String? message;

  ErrorModel _responseCodeSerializer(Response response) {
    ErrorModel error = ErrorModel.fromJson(response.data);
    if (error.error!.code == 401) {
      LogoutHelper().logOuts(AppConfig.navigatorKey.currentState!.context);
    }
    return error;
  }

  AppApiException.fromDioError(DioError dioError) {
    _errorModel.error = Error();
    switch (dioError.type) {
      case DioErrorType.cancel:
        _errorModel.error!.message = error.dioCancel;
        break;
      case DioErrorType.connectTimeout:
        _errorModel.error!.message = error.dioConnectionTimeOout;
        break;
      case DioErrorType.other:
        _errorModel.error!.message = error.dioDefault;
        break;
      case DioErrorType.receiveTimeout:
        _errorModel.error!.message = error.dioRecieveTimeout;
        break;
      case DioErrorType.response:
        _errorModel = _responseCodeSerializer(dioError.response!);
        break;
      case DioErrorType.sendTimeout:
        _errorModel.error!.message = error.dioSendTimeout;
        break;
      default:
        _errorModel.error!.message = error.unknownError;
        break;
    }
    message = _errorModel.error!.message;
  }
}
