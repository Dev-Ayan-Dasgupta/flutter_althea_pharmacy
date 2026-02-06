import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/wallet_entity.dart';
import '../../domain/entities/transaction_entity.dart';

part 'wallet_state.freezed.dart';

@freezed
abstract class WalletState with _$WalletState {
  const factory WalletState.initial() = _Initial;
  const factory WalletState.loading() = _Loading;
  const factory WalletState.loaded({
    required WalletEntity wallet,
    required List<TransactionEntity> transactions,
  }) = _Loaded;
  const factory WalletState.error(String message) = _Error;
}
