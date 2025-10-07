import 'package:bloc/bloc.dart';
import 'loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(const LoadingState.initial());

  Future<void> startLoading() async {
    emit(const LoadingState.inProgress());
    await Future.delayed(const Duration(seconds: 5));
    emit(const LoadingState.completed());
  }
}
