import 'package:bloc/bloc.dart';

class SliderCubit extends Cubit<int> {
  SliderCubit() : super((0));

  void onChanged(int value) {
    emit(value);
  }
}
