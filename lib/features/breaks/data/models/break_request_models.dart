import 'package:freezed_annotation/freezed_annotation.dart';

part 'break_request_models.freezed.dart';
part 'break_request_models.g.dart';

@freezed
class StartBreakRequest with _$StartBreakRequest {
  const factory StartBreakRequest({
    required String todoId,
    required String projectId,
    @Default('manual') String breakType,
    @Default('') String notes,
  }) = _StartBreakRequest;

  factory StartBreakRequest.fromJson(Map<String, dynamic> json) =>
      _$StartBreakRequestFromJson(json);
}

@freezed
class StopBreakRequest with _$StopBreakRequest {
  const factory StopBreakRequest({@Default('') String notes}) =
      _StopBreakRequest;

  factory StopBreakRequest.fromJson(Map<String, dynamic> json) =>
      _$StopBreakRequestFromJson(json);
}

@freezed
class BreakApiResponse with _$BreakApiResponse {
  const factory BreakApiResponse({required Map<String, dynamic> data}) =
      _BreakApiResponse;

  factory BreakApiResponse.fromJson(Map<String, dynamic> json) =>
      _$BreakApiResponseFromJson(json);
}

@freezed
class BreakListApiResponse with _$BreakListApiResponse {
  const factory BreakListApiResponse({
    required List<Map<String, dynamic>> data,
  }) = _BreakListApiResponse;

  factory BreakListApiResponse.fromJson(Map<String, dynamic> json) =>
      _$BreakListApiResponseFromJson(json);
}

@freezed
class BreakStatsApiResponse with _$BreakStatsApiResponse {
  const factory BreakStatsApiResponse({required Map<String, dynamic> data}) =
      _BreakStatsApiResponse;

  factory BreakStatsApiResponse.fromJson(Map<String, dynamic> json) =>
      _$BreakStatsApiResponseFromJson(json);
}
