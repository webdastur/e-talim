import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'last.g.dart';

@JsonSerializable()
class Last extends Equatable {
  final String? href;

  const Last({this.href});

  factory Last.fromJson(Map<String, dynamic> json) => _$LastFromJson(json);

  Map<String, dynamic> toJson() => _$LastToJson(this);

  Last copyWith({
    String? href,
  }) {
    return Last(
      href: href ?? this.href,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [href];
}
