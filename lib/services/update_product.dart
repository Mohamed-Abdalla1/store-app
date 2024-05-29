import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct({
    required String price,
    required String title,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/:id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}
