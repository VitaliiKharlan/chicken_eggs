import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/egg_item.dart';
import '../services/shop_service.dart';

// Events
abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object?> get props => [];
}

class ShopInitialized extends ShopEvent {}

class EggPurchased extends ShopEvent {
  final String eggId;

  const EggPurchased(this.eggId);

  @override
  List<Object> get props => [eggId];
}

class EggSelected extends ShopEvent {
  final String eggId;

  const EggSelected(this.eggId);

  @override
  List<Object> get props => [eggId];
}

class CoinsUpdated extends ShopEvent {
  final int coins;

  const CoinsUpdated(this.coins);

  @override
  List<Object> get props => [coins];
}

// States
abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object?> get props => [];
}

class ShopInitial extends ShopState {}

class ShopLoading extends ShopState {}

class ShopLoaded extends ShopState {
  final List<EggItem> eggs;
  final int coins;
  final String selectedEggId;

  const ShopLoaded({
    required this.eggs,
    required this.coins,
    required this.selectedEggId,
  });

  @override
  List<Object> get props => [eggs, coins, selectedEggId];

  ShopLoaded copyWith({
    List<EggItem>? eggs,
    int? coins,
    String? selectedEggId,
  }) {
    return ShopLoaded(
      eggs: eggs ?? this.eggs,
      coins: coins ?? this.coins,
      selectedEggId: selectedEggId ?? this.selectedEggId,
    );
  }
}

class ShopError extends ShopState {
  final String message;

  const ShopError(this.message);

  @override
  List<Object> get props => [message];
}

// BLoC
class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final ShopService _shopService;

  ShopBloc({required ShopService shopService})
      : _shopService = shopService,
        super(ShopInitial()) {
    on<ShopInitialized>(_onShopInitialized);
    on<EggPurchased>(_onEggPurchased);
    on<EggSelected>(_onEggSelected);
    on<CoinsUpdated>(_onCoinsUpdated);
  }

  Future<void> _onShopInitialized(
    ShopInitialized event,
    Emitter<ShopState> emit,
  ) async {
    emit(ShopLoading());
    try {
      final eggs = await _shopService.getAllEggs();
      final coins = await _shopService.getCoins();
      final selectedEggId = await _shopService.getSelectedEggId();

      emit(ShopLoaded(
        eggs: eggs,
        coins: coins,
        selectedEggId: selectedEggId,
      ));
    } catch (e) {
      emit(ShopError('Shop loading error: $e'));
    }
  }

  Future<void> _onEggPurchased(
    EggPurchased event,
    Emitter<ShopState> emit,
  ) async {
    if (state is! ShopLoaded) return;

    final currentState = state as ShopLoaded;
    emit(ShopLoading());

    try {
      final success = await _shopService.buyEgg(event.eggId);
      if (success) {
        final eggs = await _shopService.getAllEggs();
        final coins = await _shopService.getCoins();

        emit(ShopLoaded(
          eggs: eggs,
          coins: coins,
          selectedEggId: currentState.selectedEggId,
        ));
      } else {
        emit(ShopError('Not enough coins to buy'));
      }
    } catch (e) {
      emit(ShopError('Purchase error: $e'));
    }
  }

  Future<void> _onEggSelected(
    EggSelected event,
    Emitter<ShopState> emit,
  ) async {
    if (state is! ShopLoaded) return;

    final currentState = state as ShopLoaded;
    emit(ShopLoading());

    try {
      final success = await _shopService.selectEgg(event.eggId);
      if (success) {
        final eggs = await _shopService.getAllEggs();

        emit(ShopLoaded(
          eggs: eggs,
          coins: currentState.coins,
          selectedEggId: event.eggId,
        ));
      } else {
        emit(ShopError('The egg is not unlocked'));
      }
    } catch (e) {
      emit(ShopError('Egg selection error: $e'));
    }
  }

  Future<void> _onCoinsUpdated(
    CoinsUpdated event,
    Emitter<ShopState> emit,
  ) async {
    if (state is! ShopLoaded) return;

    final currentState = state as ShopLoaded;
    emit(currentState.copyWith(coins: event.coins));
  }
}
