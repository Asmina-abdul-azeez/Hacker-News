import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_news/app/models/resource.dart';
import 'package:hacker_news/domain/news/entities/news_hit.dart';

part '../../gen/news/news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
   @Default(ResourceInitial()) Resource<List<NewsHit>> newsList
  }) = _NewsState;
  
   factory NewsState.initial() {
    return const NewsState();
  }
}
