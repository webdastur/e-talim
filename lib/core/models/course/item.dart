import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends Equatable {
  final int? id;
  final String? title;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @JsonKey(name: 'author_id')
  final int? authorId;
  final String? description;
  final int? level;
  final String? photo;
  @JsonKey(name: 'cereated_at')
  final String? cereatedAt;

  const Item({
    this.id,
    this.title,
    this.categoryId,
    this.authorId,
    this.description,
    this.level,
    this.photo,
    this.cereatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  Item copyWith({
    int? id,
    String? title,
    int? categoryId,
    int? authorId,
    String? description,
    int? level,
    String? photo,
    String? cereatedAt,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      categoryId: categoryId ?? this.categoryId,
      authorId: authorId ?? this.authorId,
      description: description ?? this.description,
      level: level ?? this.level,
      photo: photo ?? this.photo,
      cereatedAt: cereatedAt ?? this.cereatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      categoryId,
      authorId,
      description,
      level,
      photo,
      cereatedAt,
    ];
  }
}
