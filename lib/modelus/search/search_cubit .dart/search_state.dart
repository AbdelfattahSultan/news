import 'package:news/network/repones/artcles/article.dart';

abstract class SearchState {}

class InitState extends SearchState {}

class LoadingState extends SearchState {}

class SuccessState extends SearchState {
  final List<Article> articles;

  SuccessState(this.articles);
}

class ErrorState extends SearchState {
  final String message;

  ErrorState(this.message);
}

class EmptyState extends SearchState {
  final String message;

  EmptyState(this.message);
}
