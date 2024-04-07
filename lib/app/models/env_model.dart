// ignore_for_file: sort_constructors_first, avoid_equals_and_hash_code_on_mutable_classes

class EnvModel {
  //<editor-fold desc="Data Methods">
  EnvModel({required this.baseUrl, this.mixPanelToken, this.uxCamToken});

  late String baseUrl;
  late String? mixPanelToken;
  late String? uxCamToken;

  factory EnvModel.fromMap(Map<String, dynamic> map) {
    return EnvModel(
        baseUrl: map['baseUrl'] as String,
        mixPanelToken: map['token'] as String,
        uxCamToken: map['uzCamToken'] as String,);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EnvModel &&
          runtimeType == other.runtimeType &&
          baseUrl == other.baseUrl &&
          mixPanelToken == other.mixPanelToken);

  @override
  int get hashCode => baseUrl.hashCode ^ mixPanelToken.hashCode;

  @override
  String toString() {
    return 'EnvModel{ baseUrl: $baseUrl, token: $mixPanelToken,}';
  }

  EnvModel copyWith({String? baseUrl, String? token, String? uxCamToken}) {
    return EnvModel(
        baseUrl: baseUrl ?? this.baseUrl,
        mixPanelToken: token ?? mixPanelToken,
        uxCamToken: uxCamToken ?? this.uxCamToken,);
  }

  Map<String, dynamic> toMap() {
    return {
      'baseUrl': baseUrl,
      'token': mixPanelToken,
    };
  }

//</editor-fold>
}
