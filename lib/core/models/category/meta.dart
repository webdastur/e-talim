import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta extends Equatable {
  final int? totalCount;
  final int? pageCount;
  final int? currentPage;
  final int? perPage;

  const Meta({
    this.totalCount,
    this.pageCount,
    this.currentPage,
    this.perPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  Meta copyWith({
    int? totalCount,
    int? pageCount,
    int? currentPage,
    int? perPage,
  }) {
    return Meta(
      totalCount: totalCount ?? this.totalCount,
      pageCount: pageCount ?? this.pageCount,
      currentPage: currentPage ?? this.currentPage,
      perPage: perPage ?? this.perPage,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      totalCount,
      pageCount,
      currentPage,
      perPage,
    ];
  }
}
