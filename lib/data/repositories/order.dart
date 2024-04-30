import 'package:ecommerce_app/data/datasources/order.dart';
import 'package:ecommerce_app/domain/entities/order.dart';
import 'package:ecommerce_app/domain/repositories/order.dart';

class OrderRepositoryImp implements IOrderRepository {
  final OrderDataSource dataSource;

  OrderRepositoryImp({required this.dataSource});

  @override
  Future<List<Order>> fetchOrders() async {
    try {
      return await dataSource.fetchOrders();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> delivered(int id, int status) async {
    try {
      return await dataSource.delivered(id, status);
    } catch (e) {
      rethrow;
    }
  }
}
