// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int?,
      title: json['title'] as String?,
      categoryId: json['category_id'] as int?,
      authorId: json['author_id'] as int?,
      description: json['description'] as String?,
      level: json['level'] as int?,
      photo: json['photo'] as String?,
      cereatedAt: json['cereated_at'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category_id': instance.categoryId,
      'author_id': instance.authorId,
      'description': instance.description,
      'level': instance.level,
      'photo': instance.photo,
      'cereated_at': instance.cereatedAt,
    };
