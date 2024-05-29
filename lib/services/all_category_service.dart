
import 'package:store_app/helpers/api.dart';

class AllCategoryService {
  Future<List<dynamic>> allCategoryService() async {
   List<dynamic> data =await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
