import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modelus/search/search_cubit%20.dart/search_state.dart';
import 'package:news/network/API/services/api_services.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(InitState());

  TextEditingController controller = TextEditingController();

  Future<void> searchArticles() async {
    try {
      emit(LoadingState());
      var response = await ApiServices().searchArticles(controller.text);
      if (response.isEmpty) {
        emit(EmptyState("is empty"));
      } else {
        emit(SuccessState(response));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void clear() {
    controller.clear();
    emit(InitState());
  }
}
