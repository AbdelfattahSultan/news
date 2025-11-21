import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modelus/home/view_model/sources_cubit/Source_cubit_state.dart';
import 'package:news/network/API/services/api_services.dart';

class SourceCubit extends Cubit<SourceCubitState> {
  SourceCubit() : super(InitState());

  Future<void> getAllSources(String categoryId) async {
    emit(LoadingState());
    try {
      var responses = await ApiServices().getAllSources(categoryId);

      if (responses.isEmpty) {
        emit(EmptyState("articles is empty"));
      } else {
        emit(SuccessState(responses));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
