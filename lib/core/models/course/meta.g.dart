// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      totalCount: json['totalCount'] as int?,
      pageCount: json['pageCount'] as int?,
      currentPage: json['currentPage'] as int?,
      perPage: json['perPage'] as int?,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'totalCount': instance.totalCount,
      'pageCount': instance.pageCount,
      'currentPage': instance.currentPage,
      'perPage': instance.perPage,
    };
