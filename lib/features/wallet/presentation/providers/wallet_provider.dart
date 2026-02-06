import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../../domain/usecases/get_wallet_usecase.dart';
import '../../data/repositories/mock_wallet_repository.dart';
import 'wallet_state.dart';

part 'wallet_provider.g.dart';

// Repository provider
@riverpod
WalletRepository walletRepository(Ref ref) {
  return MockWalletRepository();
}

// Use case provider
@riverpod
GetWalletUseCase getWalletUseCase(Ref ref) {
  return GetWalletUseCase(ref.watch(walletRepositoryProvider));
}

// Wallet state provider
@riverpod
class Wallet extends _$Wallet {
  @override
  WalletState build() {
    loadWallet();
    return const WalletState.initial();
  }

  Future<void> loadWallet() async {
    state = const WalletState.loading();

    final repository = ref.read(walletRepositoryProvider);

    final walletResult = await repository.getWallet();
    final transactionsResult = await repository.getTransactions();

    walletResult.fold((error) => state = WalletState.error(error), (wallet) {
      transactionsResult.fold(
        (error) => state = WalletState.error(error),
        (transactions) => state = WalletState.loaded(
          wallet: wallet,
          transactions: transactions,
        ),
      );
    });
  }

  Future<void> withdrawFunds(double amount) async {
    final repository = ref.read(walletRepositoryProvider);
    final result = await repository.withdrawFunds(amount);

    result.fold(
      (error) {
        // Handle error - will be shown in UI
      },
      (_) {
        loadWallet();
      },
    );
  }

  // Filter helpers
  List<TransactionEntity> getOrderTransactions() {
    return state.maybeWhen(
      loaded: (_, transactions) => transactions
          .where((t) => t.type == TransactionType.orderPayment)
          .toList(),
      orElse: () => [],
    );
  }

  List<TransactionEntity> getWithdrawals() {
    return state.maybeWhen(
      loaded: (_, transactions) => transactions
          .where((t) => t.type == TransactionType.withdrawal)
          .toList(),
      orElse: () => [],
    );
  }
}
