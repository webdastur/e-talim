import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'first.dart';
import 'last.dart';
import 'next.dart';
import 'self.dart';

part 'links.g.dart';

@JsonSerializable()
class Links extends Equatable {
  final Self? self;
  final First? first;
  final Last? last;
  final Next? next;

  const Links({this.self, this.first, this.last, this.next});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

  Links copyWith({
    Self? self,
    First? first,
    Last? last,
    Next? next,
  }) {
    return Links(
      self: self ?? this.self,
      first: first ?? this.first,
      last: last ?? this.last,
      next: next ?? this.next,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [self, first, last, next];
}
