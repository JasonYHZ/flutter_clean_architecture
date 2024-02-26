import '../model/activity.dart';

abstract class ActivityRepository {
  Future<Activity> loadActivity({String activityType = '', String? cancelKey});

  void cancelActivityLoad(String cancelKey);
}
