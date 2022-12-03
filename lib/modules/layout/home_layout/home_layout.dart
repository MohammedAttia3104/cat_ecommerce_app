import 'package:badges/badges.dart';
import 'package:cat_ecommerce_app/global/constance/AppColors.dart';
import 'package:cat_ecommerce_app/models/products_model/all_products_model.dart';
import 'package:cat_ecommerce_app/modules/cart/cart_screen.dart';
import 'package:cat_ecommerce_app/modules/layout/cubit/layout_cubit.dart';
import 'package:cat_ecommerce_app/modules/layout/cubit/layout_states.dart';
import 'package:cat_ecommerce_app/modules/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // final searchController = TextEditingController();
  // List<ProductModel>? allProducts;
  // List<ProductModel>? searchedProducts;
  //
  //
  //
  // void addSearchedForItemToSearchedList(String searchedProduct) {
  //   searchedProducts = allProducts
  //   .!where((product) => product.name.toLowerCase().startsWith(searchedProduct)).
  //   toList
  //   (
  //   );
  // }
  // Widget buildSearchField() {
  //   return TextField(
  //     cursorColor: Colors.grey,
  //     controller: searchController,
  //     decoration: const InputDecoration(
  //         border: InputBorder.none,
  //         hintText: 'Find Your Product...',
  //         hintStyle: TextStyle(
  //           color: Colors.grey,
  //           fontSize: 18,
  //         )
  //     ),
  //     onChanged: (searchedProduct) {
  //       addSearchedForItemToSearchedList(searchedProduct);
  //     },
  //   );
  // }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LayOutCubit>(context).getProductsData();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = LayOutCubit.get(context);
    int counter = 0;
    bool showElevatedButtonBadge = true;
    return BlocConsumer<LayOutCubit, LayOutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Shopee',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              Badge(
                position: BadgePosition.topEnd(top: 0, end: 7),
                badgeContent: const Text('3'),
                animationDuration: const Duration(milliseconds: 500),
                animationType: BadgeAnimationType.fade,
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColors.primaryColor,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_checkout,
                ),
                label: 'Check Out',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag,
                ),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
            ],
          ),

        );
      },
    );
  }

}
