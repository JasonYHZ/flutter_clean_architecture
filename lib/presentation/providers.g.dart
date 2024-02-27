// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityRepositoryNotifierHash() =>
    r'cd148b42d06958f5d25f728e466fcbccd7be852b';

/// Presentation
/// -----------------------------------------------------------------------------
/// Domain
/// -----------------------------------------------------------------------------
///
/// Copied from [ActivityRepositoryNotifier].
@ProviderFor(ActivityRepositoryNotifier)
final activityRepositoryNotifierProvider = AutoDisposeNotifierProvider<
    ActivityRepositoryNotifier, ActivityRepository>.internal(
  ActivityRepositoryNotifier.new,
  name: r'activityRepositoryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activityRepositoryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActivityRepositoryNotifier = AutoDisposeNotifier<ActivityRepository>;
String _$appRepositoryNotifierHash() =>
    r'7266fad1c080eee51295f8107105aed16b8513b4';

/// See also [AppRepositoryNotifier].
@ProviderFor(AppRepositoryNotifier)
final appRepositoryNotifierProvider =
    AutoDisposeNotifierProvider<AppRepositoryNotifier, AppRepository>.internal(
  AppRepositoryNotifier.new,
  name: r'appRepositoryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appRepositoryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppRepositoryNotifier = AutoDisposeNotifier<AppRepository>;
String _$userRepositoryNotifierHash() =>
    r'ce0e389c6521c99bf8e8da309cd2ee08a2465783';

/// See also [UserRepositoryNotifier].
@ProviderFor(UserRepositoryNotifier)
final userRepositoryNotifierProvider = AutoDisposeNotifierProvider<
    UserRepositoryNotifier, UserRepository>.internal(
  UserRepositoryNotifier.new,
  name: r'userRepositoryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserRepositoryNotifier = AutoDisposeNotifier<UserRepository>;
String _$authenticationNotifierHash() =>
    r'5f881d1793417acf719ce05858164d86874ccbea';

/// See also [AuthenticationNotifier].
@ProviderFor(AuthenticationNotifier)
final authenticationNotifierProvider = AutoDisposeNotifierProvider<
    AuthenticationNotifier, AuthenticationRepository>.internal(
  AuthenticationNotifier.new,
  name: r'authenticationNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthenticationNotifier
    = AutoDisposeNotifier<AuthenticationRepository>;
String _$getActivityNotifierHash() =>
    r'405e6e0fad8f33a7b2bdd5cc5cb83f670003a0d5';

/// Repository
/// -----------------------------------------------------------------------------
/// UseCase
///
/// Copied from [GetActivityNotifier].
@ProviderFor(GetActivityNotifier)
final getActivityNotifierProvider =
    AutoDisposeNotifierProvider<GetActivityNotifier, GetActivity>.internal(
  GetActivityNotifier.new,
  name: r'getActivityNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getActivityNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetActivityNotifier = AutoDisposeNotifier<GetActivity>;
String _$appUseCaseNotifierHash() =>
    r'8f73eb813c3c0d60ac5c0310544cfeb4c21fbf20';

/// See also [AppUseCaseNotifier].
@ProviderFor(AppUseCaseNotifier)
final appUseCaseNotifierProvider =
    AutoDisposeNotifierProvider<AppUseCaseNotifier, AppCase>.internal(
  AppUseCaseNotifier.new,
  name: r'appUseCaseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appUseCaseNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppUseCaseNotifier = AutoDisposeNotifier<AppCase>;
String _$userUseCaseNotifierHash() =>
    r'a5f39efb06cae24088909e03e104570fa2594e24';

/// See also [UserUseCaseNotifier].
@ProviderFor(UserUseCaseNotifier)
final userUseCaseNotifierProvider =
    AutoDisposeNotifierProvider<UserUseCaseNotifier, UserCase>.internal(
  UserUseCaseNotifier.new,
  name: r'userUseCaseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userUseCaseNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserUseCaseNotifier = AutoDisposeNotifier<UserCase>;
String _$authenticationCaseNotifierHash() =>
    r'd94997f3871a6c2312e94d588653b13d1a0a5f54';

/// See also [AuthenticationCaseNotifier].
@ProviderFor(AuthenticationCaseNotifier)
final authenticationCaseNotifierProvider = AutoDisposeNotifierProvider<
    AuthenticationCaseNotifier, AuthenticationCase>.internal(
  AuthenticationCaseNotifier.new,
  name: r'authenticationCaseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationCaseNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthenticationCaseNotifier = AutoDisposeNotifier<AuthenticationCase>;
String _$apiNotifierHash() => r'89dfc09cc9ef2391ef2f9cc4c60d0f85dd78e2f7';

/// Data
///
/// Copied from [ApiNotifier].
@ProviderFor(ApiNotifier)
final apiNotifierProvider =
    AutoDisposeNotifierProvider<ApiNotifier, Api>.internal(
  ApiNotifier.new,
  name: r'apiNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ApiNotifier = AutoDisposeNotifier<Api>;
String _$localStorageNotifierHash() =>
    r'f9e08fbb7e72b9cc58b50478bd194a73cc5f154e';

/// See also [LocalStorageNotifier].
@ProviderFor(LocalStorageNotifier)
final localStorageNotifierProvider =
    AutoDisposeNotifierProvider<LocalStorageNotifier, LocalStorage>.internal(
  LocalStorageNotifier.new,
  name: r'localStorageNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localStorageNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocalStorageNotifier = AutoDisposeNotifier<LocalStorage>;
String _$databaseNotifierHash() => r'144169214fdc8df07174f5e61d5708a629f189fd';

/// See also [DatabaseNotifier].
@ProviderFor(DatabaseNotifier)
final databaseNotifierProvider =
    AutoDisposeNotifierProvider<DatabaseNotifier, Database>.internal(
  DatabaseNotifier.new,
  name: r'databaseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DatabaseNotifier = AutoDisposeNotifier<Database>;
String _$websocketNotifierHash() => r'4544c8bb419cd31d260d869a505954ca970d0de0';

/// See also [WebsocketNotifier].
@ProviderFor(WebsocketNotifier)
final websocketNotifierProvider =
    AutoDisposeNotifierProvider<WebsocketNotifier, Websocket>.internal(
  WebsocketNotifier.new,
  name: r'websocketNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$websocketNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WebsocketNotifier = AutoDisposeNotifier<Websocket>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
