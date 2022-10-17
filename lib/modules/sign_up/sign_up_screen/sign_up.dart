import 'package:cat_ecommerce_app/global/constance/AppImages.dart';
import 'package:cat_ecommerce_app/modules/layout/home_layout/home_layout.dart';
import 'package:cat_ecommerce_app/modules/login/login_screen/login_screen.dart';
import 'package:cat_ecommerce_app/modules/sign_up/sign_up_cubit/sign_up_cubit.dart';
import 'package:cat_ecommerce_app/modules/sign_up/sign_up_cubit/sign_up_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../global/widgets/custom_button.dart';
import '../../../global/widgets/default_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneNumberController = TextEditingController();
    var passwordController = TextEditingController();
    var passwordConfigController = TextEditingController();
    var firstNameFocusNode = FocusNode();
    var lastNameFocusNode = FocusNode();
    var emailFocusNode = FocusNode();
    var phoneNumberFocusNode = FocusNode();
    var passwordFocusNode = FocusNode();
    var passwordConfigFocusNode = FocusNode();
    var formKey = GlobalKey<FormState>();

    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is CreateUserSuccessState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false);
        }
      },
      builder: (context, state) {
        var signCubit = SignUpCubit().get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Text(
              'Sign up new account',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            elevation: 0,
          ),
          body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          type: TextInputType.name,
                          focusNode: firstNameFocusNode,
                          controller: firstNameController,
                          prefixIcon: Icons.person,
                          textHint: 'Enter Your First Name',
                          textLabel: 'First Name',
                          textOnChanged: (value) {
                            debugPrint(value);
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'You should enter your first name';
                            }
                            return null;
                          },
                          textOnSubmitted: (val) => debugPrint(val),
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(lastNameFocusNode),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        DefaultTextFormField(
                          type: TextInputType.name,
                          focusNode: lastNameFocusNode,
                          controller: lastNameController,
                          prefixIcon: Icons.person,
                          textHint: 'Enter Your Last Name',
                          textLabel: 'Last Name',
                          textOnChanged: (value) {
                            debugPrint(value);
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'You should enter your Last Name';
                            }
                            return null;
                          },
                          textOnSubmitted: (val) => debugPrint(val),
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(emailFocusNode),
                        ),
                        const SizedBox(
                          height: 10.0,
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
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'You should enter your email address';
                            }
                            return null;
                          },
                          textOnSubmitted: (val) => debugPrint(val),
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(phoneNumberFocusNode),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            // Expanded(
                            //   child: CountryPickerDropdown(
                            //     initialValue: 'in',
                            //     itemBuilder: _buildDropdownItem,
                            //     onValuePicked: (Country country) {
                            //       debugPrint(country.name);
                            //     },
                            //   ),
                            // ),
                            Expanded(
                              child: DefaultTextFormField(
                                type: TextInputType.phone,
                                focusNode: phoneNumberFocusNode,
                                controller: phoneNumberController,
                                prefixIcon: Icons.phone_in_talk,
                                textHint: 'Enter Your Phone Number',
                                textLabel: 'Phone Number',
                                textOnChanged: (value) {
                                  debugPrint(value);
                                },
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'You should enter your phone number';
                                  }
                                  return null;
                                },
                                textOnSubmitted: (val) => debugPrint(val),
                                onEditingComplete: () => FocusScope.of(context)
                                    .requestFocus(passwordFocusNode),
                              ),
                            ),
                          ],
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
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'You should enter your password';
                            }
                            return null;
                          },
                          textOnSubmitted: (val) {
                            if (formKey.currentState!.validate()) {
                              debugPrint(firstNameController.text);
                              debugPrint(lastNameController.text);
                              debugPrint(emailController.text);
                              debugPrint(phoneNumberController.text);
                              debugPrint(passwordController.text);
                            }
                          },
                          suffixIcon: signCubit.suffix,
                          isObscure: signCubit.isPassword,
                          suffixOnPressed: () {
                            signCubit.changePasswordVisibility();
                          },
                          textAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: true,
                          builder: (context){
                            return  CustomButton(
                                buttonOnPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    SignUpCubit().get(context).userRegister(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      emailAddress: emailController.text,
                                      phoneNumber: phoneNumberController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                buttonText: 'Sign Up');
                          },
                          fallback: (context){
                            return const Center(child: CircularProgressIndicator(),);
                          },
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ));
                              },
                              child: const Text(
                                'Sign In',
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

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            const SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );
}
