abstract class HomePageEvent {}

class InitEvent extends HomePageEvent {}

class FetchPostsEvent extends HomePageEvent {
  int number = 30;
}
