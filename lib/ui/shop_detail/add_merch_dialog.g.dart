// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_merch_dialog.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tagListHash() => r'51eed968d2d33b5d24592e9c2a8ee5e97df76a66';

/// See also [tagList].
@ProviderFor(tagList)
final tagListProvider = AutoDisposeFutureProvider<List<String>>.internal(
  tagList,
  name: r'tagListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tagListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TagListRef = AutoDisposeFutureProviderRef<List<String>>;
String _$merchOutlineListHash() => r'ea343f400119033903fee2e928d09ea132a5b7a4';

/// See also [merchOutlineList].
@ProviderFor(merchOutlineList)
final merchOutlineListProvider =
    AutoDisposeFutureProvider<List<MerchOutline>>.internal(
  merchOutlineList,
  name: r'merchOutlineListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$merchOutlineListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MerchOutlineListRef = AutoDisposeFutureProviderRef<List<MerchOutline>>;
String _$userMerchHash() => r'f5142c9b9fb6997fb62096697cfb17ddb967ada9';

/// See also [UserMerch].
@ProviderFor(UserMerch)
final userMerchProvider =
    AutoDisposeNotifierProvider<UserMerch, PostedMerch>.internal(
  UserMerch.new,
  name: r'userMerchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userMerchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserMerch = AutoDisposeNotifier<PostedMerch>;
String _$selectedMerchOutlineHash() =>
    r'6181a7f1548b837d7feff73f4681a0a75987d927';

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

abstract class _$SelectedMerchOutline
    extends BuildlessAutoDisposeNotifier<MerchOutline?> {
  late final String? merchId;

  MerchOutline? build(
    String? merchId,
  );
}

/// See also [SelectedMerchOutline].
@ProviderFor(SelectedMerchOutline)
const selectedMerchOutlineProvider = SelectedMerchOutlineFamily();

/// See also [SelectedMerchOutline].
class SelectedMerchOutlineFamily extends Family<MerchOutline?> {
  /// See also [SelectedMerchOutline].
  const SelectedMerchOutlineFamily();

  /// See also [SelectedMerchOutline].
  SelectedMerchOutlineProvider call(
    String? merchId,
  ) {
    return SelectedMerchOutlineProvider(
      merchId,
    );
  }

  @override
  SelectedMerchOutlineProvider getProviderOverride(
    covariant SelectedMerchOutlineProvider provider,
  ) {
    return call(
      provider.merchId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'selectedMerchOutlineProvider';
}

/// See also [SelectedMerchOutline].
class SelectedMerchOutlineProvider extends AutoDisposeNotifierProviderImpl<
    SelectedMerchOutline, MerchOutline?> {
  /// See also [SelectedMerchOutline].
  SelectedMerchOutlineProvider(
    String? merchId,
  ) : this._internal(
          () => SelectedMerchOutline()..merchId = merchId,
          from: selectedMerchOutlineProvider,
          name: r'selectedMerchOutlineProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedMerchOutlineHash,
          dependencies: SelectedMerchOutlineFamily._dependencies,
          allTransitiveDependencies:
              SelectedMerchOutlineFamily._allTransitiveDependencies,
          merchId: merchId,
        );

  SelectedMerchOutlineProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.merchId,
  }) : super.internal();

  final String? merchId;

  @override
  MerchOutline? runNotifierBuild(
    covariant SelectedMerchOutline notifier,
  ) {
    return notifier.build(
      merchId,
    );
  }

  @override
  Override overrideWith(SelectedMerchOutline Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedMerchOutlineProvider._internal(
        () => create()..merchId = merchId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        merchId: merchId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SelectedMerchOutline, MerchOutline?>
      createElement() {
    return _SelectedMerchOutlineProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedMerchOutlineProvider && other.merchId == merchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, merchId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SelectedMerchOutlineRef on AutoDisposeNotifierProviderRef<MerchOutline?> {
  /// The parameter `merchId` of this provider.
  String? get merchId;
}

class _SelectedMerchOutlineProviderElement
    extends AutoDisposeNotifierProviderElement<SelectedMerchOutline,
        MerchOutline?> with SelectedMerchOutlineRef {
  _SelectedMerchOutlineProviderElement(super.provider);

  @override
  String? get merchId => (origin as SelectedMerchOutlineProvider).merchId;
}

String _$selectedTagHash() => r'c278c565b197595eff8c2eef11af73fb3e6b7b30';

/// See also [SelectedTag].
@ProviderFor(SelectedTag)
final selectedTagProvider =
    AutoDisposeNotifierProvider<SelectedTag, String>.internal(
  SelectedTag.new,
  name: r'selectedTagProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedTagHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedTag = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
