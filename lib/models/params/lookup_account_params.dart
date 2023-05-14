import 'package:json_annotation/json_annotation.dart';

part 'lookup_account_params.g.dart';

/// Parameters for looking up an account.
@JsonSerializable()
class LookupAccountParams {
  /// Constructs an instance of [LookupAccountParams].
  LookupAccountParams({required this.acct});

  /// Converts JSON into a [LookupAccountParams] instance.
  factory LookupAccountParams.fromJson(Map<String, dynamic> json) =>
      _$LookupAccountParamsFromJson(json);

  /// Converts the [LookupAccountParams] to JSON.
  Map<String, dynamic> toJson() => _$LookupAccountParamsToJson(this);

  /// Username/handle to look up.
  final String acct;
}