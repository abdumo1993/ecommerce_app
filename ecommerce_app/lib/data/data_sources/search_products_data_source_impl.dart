import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/product.dart';

import 'search_product_data_source.dart';

class SearchProductsDataSourceImpl implements SearchProductsDataSource{
  final DioClient dio = DioClient();
  @override
  Future<List<Product>> searchProducts(SearchModel searchModel) async {
     try{ 
      // var res = await dio.dio.get('/product', data: searchModel.toJson());
      //     if(res.statusCode == 200){
      //       List<dynamic> body = res.data;
      //       return body.map((item) => Product.fromJson(item)).toList();
      //     }

          List<Product> body = newItems;
          print(searchModel.searchWord);
            return body;
     }
     catch(e){}
    throw UnimplementedError();
  }

  // Mock data
      final newItems = List<Product>.generate(
        10,
        (index) => Product(
          name: 'Product ${index}',
          imageUrl: 'https://via.placeholder.com/150',
          price: 9.99,
        ),
      );

}