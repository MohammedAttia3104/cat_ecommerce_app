import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_ecommerce_app/global/widgets/custom_button.dart';
import 'package:cat_ecommerce_app/models/cart_product_model/cart_product_model.dart';
import 'package:cat_ecommerce_app/modules/cart/cubit/cart_cubit.dart';
import 'package:cat_ecommerce_app/modules/cart/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget singleCart(BuildContext context , List<CartProductModel> carts) {
  var size = MediaQuery.of(context).size;
  var height = size.height;
  var width = size.width;

  return BlocConsumer<CartCubit,CartStates>(
    listener: (context,state){},
    builder: (context,state){
      var cubit = CartCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: const Text(
            'Shopee',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: carts.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.2,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color(0xff707070),
                              spreadRadius: 3,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.3,
                              height: height * 0.16,
                              child: CachedNetworkImage(
                                imageUrl:
                                "${cubit.cartProductModel[index].image}",
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.5,
                              height: height * 0.16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${cubit.cartProductModel[index].title}',
                                    style:const TextStyle(
                                      fontSize: 18,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '\$${cubit.cartProductModel[index].price}',
                                    style:const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      const Text(
                                        'Quantity:',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: FloatingActionButton(
                                          backgroundColor: Colors.red,
                                          heroTag: 'b3',
                                          onPressed: () {},
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 40,
                                        height: 30,
                                        decoration:const BoxDecoration(
                                          color: Colors.orangeAccent,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '3',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: FloatingActionButton(
                                          backgroundColor: Colors.blue,
                                          heroTag: 'b4',
                                          onPressed: () {},
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      height: 5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: height * 0.05,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color(0xff707070),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '\$150',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomButton(
                    buttonOnPressed: () {},
                    icon: Icons.shopping_bag,
                    buttonText: 'Check Out',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

}