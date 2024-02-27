import 'package:flutter_clean_architecture/domain/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';

part 'user_dto.g.dart';

@freezed
class UserDto extends User  with _$UserDto {
  factory UserDto({
    required String id,
    required String name,
    required String email,
    required String avatar,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
