import 'package:dartz/dartz.dart';
import '../entities/wallet_entity.dart';
import '../entities/transaction_entity.dart';

abstract class WalletRepository {
  Future<Either<String, WalletEntity>> getWallet();
  Future<Either<String, List<TransactionEntity>>> getTransactions();
  Future<Either<String, void>> withdrawFunds(double amount);
  Stream<WalletEntity> watchWallet();
}
