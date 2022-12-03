import 'package:cat_ecommerce_app/global/constance/AppImages.dart';
import 'package:cat_ecommerce_app/global/widgets/custom_button.dart';
import 'package:cat_ecommerce_app/global/widgets/default_text_form_field.dart';
import 'package:cat_ecommerce_app/global/widgets/show_flutter_toast.dart';
import 'package:cat_ecommerce_app/modules/layout/home_layout/home_layout.dart';
import 'package:cat_ecommerce_app/modules/login/cubit/login_cubit.dart';
import 'package:cat_ecommerce_app/modules/login/cubit/login_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../sign_up/sign_up_screen/sign_up.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit().get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sign in your account',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Center(
                          child: Image(
                            image: AssetImage(AppImages.shoppingCart),
                            height: 200,
                            width: 200,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DefaultTextFormField(
                          type: TextInputType.emailAddress,
                          focusNode: emailFocusNode,
                          controller: emailController,
                          prefixIcon: Icons.email_rounded,
                          textHint: 'Enter Your Email Address',
                          textLabel: 'Email Address',
                          textOnChanged: (value) {
                            debugPrint(value);
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'You should enter your email address';
                            }
                            return null;
                          },
                          textOnSubmitted: (val) => debugPrint(val),
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(passwordFocusNode),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        DefaultTextFormField(
                          type: TextInputType.visiblePassword,
                          focusNode: passwordFocusNode,
                          controller: passwordController,
                          prefixIcon: Icons.lock,
                          textHint: 'Enter Your password',
                          textLabel: 'Password',
                          textOnChanged: (value) {
                            debugPrint(value);
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'You should enter your password';
                            }
                            return null;
                          },
                          textOnSubmitted: (val) {
                            if (formKey.currentState!.validate()) {
                              debugPrint(emailController.text);
                              debugPrint(passwordController.text);
                            }
                          },
                          suffixIcon: cubit.suffix,
                          isObscure: cubit.isPassword,
                          suffixOnPressed: () {
                            cubit.changePasswordVisibility();
                          },
                          // toDo : Question Here
                          textAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: true,
                          builder: (context) {
                            return CustomButton(
                              buttonOnPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.userLoginWithEmailAndPassword(
                                    emailAddress: emailController.text,
                                    password: passwordController.text,
                                  );
                                } else {
                                  debugPrint('Not valid');
                                }
                              },
                              buttonText: 'Sign In',
                            );
                          },
                          fallback: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ));
                              },
                              child: const Text(
                                'Sign Up',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
