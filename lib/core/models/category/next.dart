import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'next.g.dart';

@JsonSerializable()
class Next extends Equatable {
  final String? href;

  const Next({this.href});

  factory Next.fromJson(Map<String, dynamic> json) => _$NextFromJson(json);

  Map<String, dynamic> toJson() => _$NextToJson(this);

  Next copyWith({
    String? href,
  }) {
    return Next(
      href: href ?? this.href,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [href];
}
