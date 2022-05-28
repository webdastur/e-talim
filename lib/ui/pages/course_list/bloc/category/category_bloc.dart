import 'package:bloc/bloc.dart';
import 'package:e_talim/core/models/category/category.dart';
import 'package:e_talim/core/services/http_service.dart';
import 'package:e_talim/core/services/store_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryState()) {
    on<CategoryLoaded>(_onCategoryLoaded);
  }

  Future<void> _onCategoryLoaded(
    CategoryLoaded event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    Category? category = await Modular.get<HttpService>().getCategories(
      Modular.get<StoreService>().token ?? '',
    );

    emit(state.copyWith(isLoading: false, category: category));
  }
}
