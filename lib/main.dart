import 'package:cat_ecommerce_app/global/shared/local/cart_database_helper.dart';
import 'package:cat_ecommerce_app/global/shared/remote/dio_helper.dart';
import 'package:cat_ecommerce_app/modules/cart/cart_screen.dart';
import 'package:cat_ecommerce_app/modules/cart/cubit/cart_cubit.dart';
import 'package:cat_ecommerce_app/modules/layout/cubit/layout_cubit.dart';
import 'package:cat_ecommerce_app/modules/login/cubit/login_cubit.dart';
import 'package:cat_ecommerce_app/modules/sign_up/sign_up_cubit/sign_up_cubit.dart';
import 'package:cat_ecommerce_app/global/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'global/bloc_observer.dart';
import 'modules/all_products/all_products.dart';
import 'modules/layout/home_layout/home_layout.dart';
import 'modules/login/login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  CartDatabaseHelper.db;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => SignUpCubit()),
        BlocProvider(create: (_) => LayOutCubit()..getProductsData(),),
        BlocProvider(create: (_) => CartCubit()..getAllProduct(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme:const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black,
            )
          ),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
