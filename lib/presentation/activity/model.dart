// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter_clean_architecture/domain/model/activity.dart';
import 'package:flutter_clean_architecture/presentation/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'model.g.dart';

enum ActivityPageStatus { initial, loading, success, failure }

class ActivityPageState {
  final ActivityPageStatus status;

  final Activity? activity;

  ActivityPageState({this.activity, this.status = ActivityPageStatus.initial});

  ActivityPageState copyWith({
    Activity? activity,
    ActivityPageStatus? status,
  }) {
    return ActivityPageState(
      activity: activity ?? this.activity,
      status: status ?? this.status,
    );
  }
}

@riverpod
class ActivityPageNotifier extends _$ActivityPageNotifier {
  @override
  ActivityPageState build() => ActivityPageState();

  Future<void> fetchActivity() async {
    final cancelToken = DateTime.now().microsecondsSinceEpoch.toString();

    final provider = ref.read(getActivityNotifierProvider);

    ref.onDispose(() {
      provider.cancelActivityLoad(cancelToken);
    });

    final data = await provider.loadActivity(cancelToken: cancelToken);
    state = state.copyWith(activity: data, status: ActivityPageStatus.success);
  }
}
