import 'package:cat_ecommerce_app/global/shared/local/cart_database_helper.dart';
import 'package:cat_ecommerce_app/models/cart_product_model/cart_product_model.dart';
import 'package:cat_ecommerce_app/modules/cart/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/cart_product_model/cart_product_model.dart';

class CartCubit extends Cubit<CartStates>{
  CartCubit():super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  // Named Constructor call getAllProduct() .

  getAllProduct()async{
    emit(CartLoadingState());
    var dbHelper = CartDatabaseHelper.db;
    debugPrint('${_cartProductModel.length}'); //value Not Zero :)
    _cartProductModel = await dbHelper.getAllProduct();
    //18.30

  }


  addProduct(CartProductModel cartProductModel)async{
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    emit(CartSuccessState());
  }

}