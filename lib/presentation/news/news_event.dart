class NewsEvent {}

class GetNewsListEvent extends NewsEvent {}

class LoadWebview extends NewsEvent {
  LoadWebview({required this.url});

  final String url;
}
