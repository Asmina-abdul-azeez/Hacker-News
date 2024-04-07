import 'dart:convert';

class RestErrorDetails {
  RestErrorDetails();

  List<RestError>? errors = [];

  static RestError errorFromJson(Map<String, dynamic> json) {
    try {
      // ignore: avoid_dynamic_calls
      return RestError.fromMap(json['errors'][0] as Map<String, dynamic>);
    } catch (e) {
      return RestError.unknownError();
    }
  }

  static RestError serverUnknownError(int status) {
    return RestError(
      detail: 'Server Error',
      title: 'Unable to process the request',
      status: status,
    );
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

class RestError {
//<editor-fold desc="Data Methods">
  RestError({
    this.status,
    this.title,
    this.detail,
  });

  factory RestError.fromMap(Map<String, dynamic> map) {
    final error = RestError(
      status: map['status'] as int,
      title: map['title'] as String,
      detail: map['detail'] as String,
    );
    return error;
  }

  RestError.unknownError() {
    RestError(status: 502, title: 'Unknown Error', detail: 'Unknown Error');
  }

  int? status = 0;
  String? title = '';
  String? detail = '';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RestError &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          title == other.title &&
          detail == other.detail);

  @override
  int get hashCode => status.hashCode ^ title.hashCode ^ detail.hashCode;

  @override
  String toString() {
    return 'RestError{ status: $status, title: $title, detail: $detail,}';
  }

  RestError copyWith({
    int? status,
    String? title,
    String? detail,
  }) {
    return RestError(
      status: status ?? this.status,
      title: title ?? this.title,
      detail: detail ?? this.detail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'title': title,
      'detail': detail,
    };
  }

//</editor-fold>
}
