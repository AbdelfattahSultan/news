import 'package:news/network/repones/sources/source.dart';

abstract class SourceCubitState {

}

class InitState extends SourceCubitState {}
class LoadingState extends SourceCubitState {}
class ErrorState extends SourceCubitState {
  final String message;
  ErrorState(this.message);
}
class SuccessState extends SourceCubitState {
  final List<Source> sources;
  SuccessState(this.sources);
}
class EmptyState extends SourceCubitState {
  final String message;
  EmptyState(this.message);
}