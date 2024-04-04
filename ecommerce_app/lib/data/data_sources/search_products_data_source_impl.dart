import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/product.dart';

import 'search_product_data_source.dart';

class SearchProductsDataSourceImpl implements SearchProductsDataSource{
  final DioClient dio = DioClient();
  int count =0;
  @override
  Future<ProductResponseModel> searchProducts(SearchModel searchModel) async {
     try{ 
      //request 
          // print("${searchModel.searchWord}, ${searchModel.low}, ${searchModel.high}, ${searchModel.start}, ${searchModel.maxSize}, ${searchModel.category}");

      var res = await dio.dio.get('/product', data: searchModel.toJson(),queryParameters: {"start":searchModel.start,"maxSize":searchModel.maxSize});
          if(res.statusCode == 200){
            var dto = res.data['productDtos'];
            var dtocount = res.data['productDtos'].length;
            List<Product> v = [];
            for(int i=0; i < dtocount; i++){
                Map<String,dynamic> r =dto[i];
                try{
                    var product = Product.fromJson(r);
                    v.add(product);
                    }
                catch(e){
                  //handle error
                    // print("Erroe: $e");
                }
            }
try{ProductResponseModel responseModel = ProductResponseModel.fromJson(res.data,v);
            return responseModel;}
            catch(e){
              //handle error
              // print(e);
            }

          }
     }
     catch(e){}
    throw UnimplementedError();
  }

  // Mock data
      // final newItems = List<Product>.generate(
      //   10,
      //   (index) => Product(
      //     name: 'Product ${index}',
      //     imageUrl: ['https://via.placeholder.com/150'],
      //     price: 9.99,
      //   ),
      // );

}