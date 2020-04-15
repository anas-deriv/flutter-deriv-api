/// Autogenerated from flutter_deriv_api|lib/api/paymentagent_list_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'paymentagent_list_send.g.dart';

/// JSON conversion for 'paymentagent_list_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PaymentagentListRequest extends Request {
  /// Initialize PaymentagentListRequest
  PaymentagentListRequest(
      {this.currency,
      this.paymentagentList,
      Map<String, dynamic> passthrough,
      int reqId})
      : super(passthrough: passthrough, reqId: reqId);

  /// Creates instance from JSON
  factory PaymentagentListRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentagentListRequestFromJson(json);

  // Properties
  /// [Optional] If specified, only payment agents that supports that currency will be returned (obtained from `payout_currencies` call).
  String currency;

  /// Client's 2-letter country code (obtained from `residence_list` call).
  String paymentagentList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$PaymentagentListRequestToJson(this);
}