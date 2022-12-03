import 'package:cat_ecommerce_app/global/constance/end_points.dart';
import 'package:cat_ecommerce_app/global/shared/remote/dio_helper.dart';
import 'package:cat_ecommerce_app/models/products_model/all_products_model.dart';
import 'package:cat_ecommerce_app/modules/all_category/category_screen.dart';
import 'package:cat_ecommerce_app/modules/all_products/all_products.dart';
import 'package:cat_ecommerce_app/modules/all_products/products_screen.dart';
import 'package:cat_ecommerce_app/modules/cart/cart_screen.dart';
import 'package:cat_ecommerce_app/modules/check_out/check_out_screen.dart';
import 'package:cat_ecommerce_app/modules/order/order_screen.dart';
import 'package:cat_ecommerce_app/modules/profile/personal_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/products_model/all_products_model.dart';
import '../../../models/products_model/all_products_model.dart';
import 'layout_states.dart';

class LayOutCubit extends Cubit<LayOutStates> {
  LayOutCubit() : super(LayOutInitialState());

  static LayOutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = const [
    ProductsScreen(),
    CategoryScreen(),
    CheckOutScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  void changeBottomNavBar(index) {
    currentIndex = index;
    emit(LayOutChangeBottomNavState());
  }

  List<ProductModel> products = [];

  void getProductsData() {
    emit(LayOutProductsLoadingState());
    DioHelper.getProductsData(
      url: allProducts,
    ).then((value) {
      products = value;
      //print(products[0].title);
      //print('hellooo');
      //allProductsModel = AllProductsModel.fromJson(value?.data);
      //allProductsModel?.map((e) => AllProductsModel.fromJson(e)).toList();
      //(response!.data as List).map((e) => AllProductsModel.fromJson(e)).toList();
      //print(value?.data);
      //print(allProductsModel?.id ?? 'null');
      emit(LayOutProductsSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(LayOutProductsErrorState(error.toString()));
    });
  }
}
