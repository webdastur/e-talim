part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final Category? category;
  final bool isLoading;

  CategoryState({
    this.category,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [category, isLoading];

  @override
  bool? get stringify => true;

  CategoryState copyWith({
    Category? category,
    bool? isLoading,
  }) {
    return CategoryState(
      category: category ?? this.category,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
