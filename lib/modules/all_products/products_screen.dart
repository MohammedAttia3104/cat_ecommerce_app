import 'package:cat_ecommerce_app/modules/layout/cubit/layout_cubit.dart';
import 'package:cat_ecommerce_app/modules/layout/cubit/layout_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_products.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayOutCubit, LayOutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: LayOutCubit.get(context).products.isNotEmpty,
          builder: (context) => allProductScreen(context, LayOutCubit.get(context).products ) ,
          fallback:(context) => const Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
