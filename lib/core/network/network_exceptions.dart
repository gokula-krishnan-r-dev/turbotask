import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

/// Network exceptions using freezed for type-safe error handling.
/// Provides structured error types for different network scenarios.
@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  /// Create NetworkExceptions from DioException
  static NetworkExceptions fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        return const NetworkExceptions.requestCancelled();

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkExceptions.requestTimeout();

      case DioExceptionType.sendTimeout:
        return const NetworkExceptions.sendTimeout();

      case DioExceptionType.badResponse:
        switch (dioException.response?.statusCode) {
          case 400:
            return const NetworkExceptions.badRequest();
          case 401:
            return const NetworkExceptions.unauthorisedRequest();
          case 404:
            return NetworkExceptions.notFound("Not found");
          case 405:
            return const NetworkExceptions.methodNotAllowed();
          case 406:
            return const NetworkExceptions.notAcceptable();
          case 408:
            return const NetworkExceptions.requestTimeout();
          case 409:
            return const NetworkExceptions.conflict();
          case 500:
            return const NetworkExceptions.internalServerError();
          case 501:
            return const NetworkExceptions.notImplemented();
          case 503:
            return const NetworkExceptions.serviceUnavailable();
          default:
            final responseCode = dioException.response?.statusCode;
            return NetworkExceptions.defaultError(
              "Received invalid status code: $responseCode",
            );
        }

      case DioExceptionType.unknown:
        if (dioException.error.toString().contains("SocketException")) {
          return const NetworkExceptions.noInternetConnection();
        }
        return const NetworkExceptions.unexpectedError();

      case DioExceptionType.connectionError:
        return const NetworkExceptions.noInternetConnection();

      case DioExceptionType.badCertificate:
        return const NetworkExceptions.defaultError("Bad certificate");

      default:
        return const NetworkExceptions.unexpectedError();
    }
  }

  /// Get error message for display to user
  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(
      notImplemented: () {
        errorMessage = "Not Implemented";
      },
      requestCancelled: () {
        errorMessage = "Request Cancelled";
      },
      internalServerError: () {
        errorMessage = "Internal Server Error";
      },
      notFound: (String reason) {
        errorMessage = reason;
      },
      serviceUnavailable: () {
        errorMessage = "Service unavailable";
      },
      methodNotAllowed: () {
        errorMessage = "Method Allowed";
      },
      badRequest: () {
        errorMessage = "Bad request";
      },
      unauthorisedRequest: () {
        errorMessage = "Unauthorised request";
      },
      unexpectedError: () {
        errorMessage = "Unexpected error occurred";
      },
      requestTimeout: () {
        errorMessage = "Connection request timeout";
      },
      noInternetConnection: () {
        errorMessage = "No internet connection";
      },
      conflict: () {
        errorMessage = "Error due to a conflict";
      },
      sendTimeout: () {
        errorMessage = "Send timeout in connection with API server";
      },
      unableToProcess: () {
        errorMessage = "Unable to process the data";
      },
      defaultError: (String error) {
        errorMessage = error;
      },
      formatException: () {
        errorMessage = "Unexpected error occurred";
      },
      notAcceptable: () {
        errorMessage = "Not acceptable";
      },
    );
    return errorMessage;
  }
}
