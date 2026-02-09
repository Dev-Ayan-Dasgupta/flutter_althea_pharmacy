import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/order_entity.dart';

part 'new_order_notifier.g.dart';

@riverpod
class NewOrderNotifier extends _$NewOrderNotifier {
  @override
  OrderEntity? build() {
    return null;
  }

  void showNewOrder(OrderEntity order) {
    state = order;
  }

  void dismissNewOrder() {
    state = null;
  }
}
