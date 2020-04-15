/// Autogenerated from flutter_deriv_api|lib/api/notification_event_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'notification_event_send.g.dart';

/// JSON conversion for 'notification_event_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NotificationEventRequest extends Request {
  /// Initialize NotificationEventRequest
  NotificationEventRequest(
      {this.category,
      this.event,
      this.notificationEvent = 1,
      Map<String, dynamic> passthrough,
      int reqId})
      : super(passthrough: passthrough, reqId: reqId);

  /// Creates instance from JSON
  factory NotificationEventRequest.fromJson(Map<String, dynamic> json) =>
      _$NotificationEventRequestFromJson(json);

  // Properties
  /// The category or nature of the event.
  String category;

  /// The name of the event.
  String event;

  /// Must be `1`
  int notificationEvent;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$NotificationEventRequestToJson(this);
}