import 'package:cat_ecommerce_app/global/widgets/show_flutter_toast.dart';
import 'package:cat_ecommerce_app/models/user_data_model/user_data_model.dart';
import 'package:cat_ecommerce_app/modules/sign_up/sign_up_cubit/sign_up_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  SignUpCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        userCreate(
          firstName: firstName,
          lastName: lastName,
          emailAddress: emailAddress,
          phoneNumber: phoneNumber,
          uId: value.user!.uid,
        );
      });
    } on FirebaseAuthException catch (e) {
      emit(SignUpErrorState());
      if (e.code == 'weak-password') {
        showFlutterToast(
          text: 'The password provided is too weak',
          state: ToastState.warning,
        );
      } else if (e.code == 'email-already-in-use') {
        showFlutterToast(
          text: 'The account already exists for that email',
          state: ToastState.warning,
        );
      }
    } catch (e) {
      emit(SignUpErrorState());
      showFlutterToast(text: '$e', state: ToastState.warning);
    }
  }

  void userCreate({
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String phoneNumber,
    required String uId,
  }) {
    UserDataModel model = UserDataModel(
      emailAddress: emailAddress,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(SignUpChangePasswordState());
  }
}
