import 'package:dio/dio.dart';

import '../../entity/activity_dto.dart';

abstract class Api {
  Future<ActivityDto> loadActivity(
      {String activityType = '', CancelToken? cancelToken});
}

class ApiImpl implements Api {
  final dio = Dio();

  @override
  Future<ActivityDto> loadActivity(
      {String activityType = '', CancelToken? cancelToken}) async {
    final response = await dio.get(
      'https://boredapi.com/api/activity',
      queryParameters: {'type': activityType},
      cancelToken: cancelToken,
    );

    final json = response.data as Map<String, dynamic>;
    return ActivityDto.fromJson(json);
  }
}
