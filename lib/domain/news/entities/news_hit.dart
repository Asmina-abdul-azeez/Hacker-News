import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../gen/news/news_hit.freezed.dart';

part '../../../gen/news/news_hit.g.dart';

@freezed
class NewsHit with _$NewsHit {
  const factory NewsHit({String? url, int? points, String? title}) = _NewsHit;
  factory NewsHit.fromJson(Map<String, dynamic> json) => _$NewsHitFromJson(json);
}