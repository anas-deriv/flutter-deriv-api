/// Autogenerated from flutter_deriv_api|lib/api/copytrading_list_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'copytrading_list_receive.g.dart';

/// JSON conversion for 'copytrading_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CopytradingListResponse extends Response {
  /// Initialize CopytradingListResponse
  CopytradingListResponse(
      {this.copytradingList,
      Map<String, dynamic> echoReq,
      Map<String, dynamic> error,
      String msgType,
      int reqId})
      : super(echoReq: echoReq, error: error, msgType: msgType, reqId: reqId);

  /// Creates instance from JSON
  factory CopytradingListResponse.fromJson(Map<String, dynamic> json) =>
      _$CopytradingListResponseFromJson(json);

  // Properties
  /// The trading information of copiers or traders.
  Map<String, dynamic> copytradingList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CopytradingListResponseToJson(this);
}