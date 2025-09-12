// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_requests_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pullRequestsRepositoryHash() =>
    r'ae0421c18362bbfe62aac840f34ee3a45b9620a7';

/// See also [pullRequestsRepository].
@ProviderFor(pullRequestsRepository)
final pullRequestsRepositoryProvider =
    AutoDisposeProvider<PullRequestsRepository>.internal(
      pullRequestsRepository,
      name: r'pullRequestsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$pullRequestsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PullRequestsRepositoryRef =
    AutoDisposeProviderRef<PullRequestsRepository>;
String _$pullRequestsHash() => r'7e95f0731f1ff7a18709220cc8afaecaa3ec441e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [pullRequests].
@ProviderFor(pullRequests)
const pullRequestsProvider = PullRequestsFamily();

/// See also [pullRequests].
class PullRequestsFamily extends Family<AsyncValue<List<PullRequestModel>>> {
  /// See also [pullRequests].
  const PullRequestsFamily();

  /// See also [pullRequests].
  PullRequestsProvider call(
    ({String owner, String repo, String state}) params,
  ) {
    return PullRequestsProvider(params);
  }

  @override
  PullRequestsProvider getProviderOverride(
    covariant PullRequestsProvider provider,
  ) {
    return call(provider.params);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pullRequestsProvider';
}

/// See also [pullRequests].
class PullRequestsProvider
    extends AutoDisposeFutureProvider<List<PullRequestModel>> {
  /// See also [pullRequests].
  PullRequestsProvider(({String owner, String repo, String state}) params)
    : this._internal(
        (ref) => pullRequests(ref as PullRequestsRef, params),
        from: pullRequestsProvider,
        name: r'pullRequestsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$pullRequestsHash,
        dependencies: PullRequestsFamily._dependencies,
        allTransitiveDependencies:
            PullRequestsFamily._allTransitiveDependencies,
        params: params,
      );

  PullRequestsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final ({String owner, String repo, String state}) params;

  @override
  Override overrideWith(
    FutureOr<List<PullRequestModel>> Function(PullRequestsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PullRequestsProvider._internal(
        (ref) => create(ref as PullRequestsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PullRequestModel>> createElement() {
    return _PullRequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PullRequestsProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PullRequestsRef on AutoDisposeFutureProviderRef<List<PullRequestModel>> {
  /// The parameter `params` of this provider.
  ({String owner, String repo, String state}) get params;
}

class _PullRequestsProviderElement
    extends AutoDisposeFutureProviderElement<List<PullRequestModel>>
    with PullRequestsRef {
  _PullRequestsProviderElement(super.provider);

  @override
  ({String owner, String repo, String state}) get params =>
      (origin as PullRequestsProvider).params;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
