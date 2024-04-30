import 'package:ecommerce_app/domain/entities/order.dart';

abstract class IOrderRepository {
  Future<List<Order>> fetchOrders();
  Future<bool> delivered(int id, int status);
}
