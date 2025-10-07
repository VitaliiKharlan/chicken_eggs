
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_state.freezed.dart';

@freezed
abstract class LoadingState with _$LoadingState {
  const factory LoadingState.initial() = LoadingInitial;
  const factory LoadingState.inProgress() = LoadingInProgress;
  const factory LoadingState.completed() = LoadingCompleted;
}