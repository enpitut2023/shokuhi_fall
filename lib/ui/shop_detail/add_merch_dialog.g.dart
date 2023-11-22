// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_merch_dialog.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$merchDetailListHash() => r'0708f16eac0b51cd5b0f865d95c07f8697d82478';

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

/// See also [merchDetailList].
@ProviderFor(merchDetailList)
const merchDetailListProvider = MerchDetailListFamily();

/// See also [merchDetailList].
class MerchDetailListFamily extends Family<AsyncValue<List<MerchDetail>>> {
  /// See also [merchDetailList].
  const MerchDetailListFamily();

  /// See also [merchDetailList].
  MerchDetailListProvider call({
    required String shopId,
  }) {
    return MerchDetailListProvider(
      shopId: shopId,
    );
  }

  @override
  MerchDetailListProvider getProviderOverride(
    covariant MerchDetailListProvider provider,
  ) {
    return call(
      shopId: provider.shopId,
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
  String? get name => r'merchDetailListProvider';
}

/// See also [merchDetailList].
class MerchDetailListProvider
    extends AutoDisposeFutureProvider<List<MerchDetail>> {
  /// See also [merchDetailList].
  MerchDetailListProvider({
    required String shopId,
  }) : this._internal(
          (ref) => merchDetailList(
            ref as MerchDetailListRef,
            shopId: shopId,
          ),
          from: merchDetailListProvider,
          name: r'merchDetailListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$merchDetailListHash,
          dependencies: MerchDetailListFamily._dependencies,
          allTransitiveDependencies:
              MerchDetailListFamily._allTransitiveDependencies,
          shopId: shopId,
        );

  MerchDetailListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shopId,
  }) : super.internal();

  final String shopId;

  @override
  Override overrideWith(
    FutureOr<List<MerchDetail>> Function(MerchDetailListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MerchDetailListProvider._internal(
        (ref) => create(ref as MerchDetailListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        shopId: shopId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<MerchDetail>> createElement() {
    return _MerchDetailListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MerchDetailListProvider && other.shopId == shopId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MerchDetailListRef on AutoDisposeFutureProviderRef<List<MerchDetail>> {
  /// The parameter `shopId` of this provider.
  String get shopId;
}

class _MerchDetailListProviderElement
    extends AutoDisposeFutureProviderElement<List<MerchDetail>>
    with MerchDetailListRef {
  _MerchDetailListProviderElement(super.provider);

  @override
  String get shopId => (origin as MerchDetailListProvider).shopId;
}

String _$userMerchHash() => r'26a90c6f9c325ac0537927f6b264133fec60d6fe';

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
String _$selectedMerchDetailHash() =>
    r'3f6cd68b783ef96261912e8cb55d4d4c5f6b3246';

/// See also [SelectedMerchDetail].
@ProviderFor(SelectedMerchDetail)
final selectedMerchDetailProvider =
    AutoDisposeNotifierProvider<SelectedMerchDetail, MerchDetail?>.internal(
  SelectedMerchDetail.new,
  name: r'selectedMerchDetailProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedMerchDetailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedMerchDetail = AutoDisposeNotifier<MerchDetail?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
