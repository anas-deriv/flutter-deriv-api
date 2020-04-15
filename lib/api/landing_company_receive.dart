/// Autogenerated from flutter_deriv_api|lib/api/landing_company_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'landing_company_receive.g.dart';

/// JSON conversion for 'landing_company_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class LandingCompanyResponse extends Response {
  /// Initialize LandingCompanyResponse
  LandingCompanyResponse(
      {this.landingCompany,
      Map<String, dynamic> echoReq,
      Map<String, dynamic> error,
      String msgType,
      int reqId})
      : super(echoReq: echoReq, error: error, msgType: msgType, reqId: reqId);

  /// Creates instance from JSON
  factory LandingCompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$LandingCompanyResponseFromJson(json);

  // Properties
  /// Landing Company
  Map<String, dynamic> landingCompany;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$LandingCompanyResponseToJson(this);
}