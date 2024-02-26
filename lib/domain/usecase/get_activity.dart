import 'package:flutter_clean_architecture/domain/model/activity.dart';
import 'package:flutter_clean_architecture/domain/repository/activitys.dart';

class GetActivity {
  final ActivityRepository _repository;

  GetActivity({
    required ActivityRepository repository,
  }) : _repository = repository;

  Future<Activity> loadActivity(
      {String activityType = '', String? cancelToken}) async {
    return await _repository.loadActivity(
        activityType: activityType, cancelKey: cancelToken);
  }

  void cancelActivityLoad(String cancelKey) {
    _repository.cancelActivityLoad(cancelKey);
  }
}
