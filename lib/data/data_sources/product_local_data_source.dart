
import '../../domain/entities/product.dart';
import 'product_remote_data_source.dart'; // Assuming you have a Result class for handling success and error states

class ProductLocalDataSource implements ProductRemoteDataSource {
 @override
 Future<List<Product>> fetchProducts({int page = 1, int itemsPerPage = 10}) async {
    print("localdata");
    // Simulate a delay to mimic network latency
    await Future.delayed(Duration(seconds: 1));

    // Dummy list of products
    List<Product> products = [
      // Product(name: 'Product 1', price: 10.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 2', price: 20.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 1', price: 10.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 2', price: 20.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 1', price: 10.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 2', price: 20.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 1', price: 10.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 2', price: 20.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 1', price: 10.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 2', price: 20.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 1', price: 10.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 2', price: 20.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 1', price: 10.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 2', price: 20.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 1', price: 10.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 2', price: 20.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 1', price: 10.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 2', price: 20.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 1', price: 10.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 2', price: 20.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 1', price: 10.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Product(name: 'Product 2', price: 20.0, imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      // Add more dummy products as needed
    ];

    // Simulate pagination
    int start = (page - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    List<Product> paginatedProducts = products.sublist(start, end > products.length ? products.length : end);

    return paginatedProducts;
 }
}
