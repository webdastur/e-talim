import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item.dart';
import 'links.dart';
import 'meta.dart';

part 'course.g.dart';

@JsonSerializable()
class Course extends Equatable {
  final List<Item>? items;
  @JsonKey(name: '_links')
  final Links? links;
  @JsonKey(name: '_meta')
  final Meta? meta;

  const Course({this.items, this.links, this.meta});

  factory Course.fromJson(Map<String, dynamic> json) {
    return _$CourseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  Course copyWith({
    List<Item>? items,
    Links? links,
    Meta? meta,
  }) {
    return Course(
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
