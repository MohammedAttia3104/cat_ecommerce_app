abstract class LayOutStates {}

class LayOutInitialState extends LayOutStates {}

class LayOutChangeBottomNavState extends LayOutStates {}

class LayOutProductsLoadingState extends LayOutStates {}

class LayOutProductsSuccessState extends LayOutStates {}

class LayOutProductsErrorState extends LayOutStates {
  final String error;
  LayOutProductsErrorState(this.error);
}
