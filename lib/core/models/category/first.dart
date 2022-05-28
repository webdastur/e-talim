import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'first.g.dart';

@JsonSerializable()
class First extends Equatable {
  final String? href;

  const First({this.href});

  factory First.fromJson(Map<String, dynamic> json) => _$FirstFromJson(json);

  Map<String, dynamic> toJson() => _$FirstToJson(this);

  First copyWith({
    String? href,
  }) {
    return First(
      href: href ?? this.href,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [href];
}
