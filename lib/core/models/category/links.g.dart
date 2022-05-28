// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      self: json['self'] == null
          ? null
          : Self.fromJson(json['self'] as Map<String, dynamic>),
      first: json['first'] == null
          ? null
          : First.fromJson(json['first'] as Map<String, dynamic>),
      last: json['last'] == null
          ? null
          : Last.fromJson(json['last'] as Map<String, dynamic>),
      next: json['next'] == null
          ? null
          : Next.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
      'first': instance.first,
      'last': instance.last,
      'next': instance.next,
    };
