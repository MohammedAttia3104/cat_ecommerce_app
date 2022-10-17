import 'package:cat_ecommerce_app/global/constance/end_points.dart';
import 'package:cat_ecommerce_app/models/products_model/all_products_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<List<ProductModel>> getProductsData({
    required String url,
  }) async {
    Response? response = await dio?.get(
      url,
    );
    return (response!.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  static Future<ProductModel> getSingleProduct({
    required int productId,
  }) async {
    Response? response = await Dio().get('$baseUrl$allProducts$productId');
    ProductModel productModel = ProductModel.fromJson(response.data);
    print(productModel);
    print('--------------------------------------------------');
    return productModel;
  }


// static Future<List<AllProductsModel>> getAllProducts() async{
//   try{
//     Response? response =  await dio?.get('$baseUrl$allProducts');
//     debugPrint(response?.data.toString() ?? 'null');
//     return (response!.data as List).map((e) => AllProductsModel.fromJson(e)).toList();
//   }catch(e){
//     debugPrint(e.toString());
//     return [];
//   }
// }
//

// static Future<List<AllProductsModel>> getProducts() async {
//   Response response = await Dio().get('https://fakestoreapi.com/products');
//   return (response.data as List).map((x) => AllProductsModel.fromJson(x)).toList();
// }

// static Future<Response?> getAllProducts({
//   required String url,
//   String? token,
// }) async{
//   return await dio?.get(url);
// }

}
