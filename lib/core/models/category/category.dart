import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item.dart';
import 'links.dart';
import 'meta.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  final List<Item>? items;
  @JsonKey(name: '_links')
  final Links? links;
  @JsonKey(name: '_meta')
  final Meta? meta;

  const Category({this.items, this.links, this.meta});

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category copyWith({
    List<Item>? items,
    Links? links,
    Meta? meta,
  }) {
    return Category(
      items: items ?? this.items,
      links: links ?? this.links,
      meta: meta ?? this.meta,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [items, links, meta];
}
