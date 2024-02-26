import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clean_architecture/domain/model/activity.dart';

part 'activity_dto.freezed.dart';

part 'activity_dto.g.dart';

@freezed
class ActivityDto extends Activity with _$ActivityDto {
  factory ActivityDto({
    required String key,
    required String activity,
    required String type,
    required int participants,
    required double price,
  }) = _ActivityDto;

  factory ActivityDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityDtoFromJson(json);
}
