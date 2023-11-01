// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shopListHash() => r'dd00430f54741b5a35cdfa3b3639d0c27ecfeb6b';

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

/// See also [shopList].
@ProviderFor(shopList)
const shopListProvider = ShopListFamily();

/// See also [shopList].
class ShopListFamily extends Family<AsyncValue<List<Shop>>> {
  /// See also [shopList].
  const ShopListFamily();

  /// See also [shopList].
  ShopListProvider call({
    String? merchId,
  }) {
    return ShopListProvider(
      merchId: merchId,
    );
  }

  @override
  ShopListProvider getProviderOverride(
    covariant ShopListProvider provider,
  ) {
    return call(
      merchId: provider.merchId,
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
  String? get name => r'shopListProvider';
}

/// See also [shopList].
class ShopListProvider extends AutoDisposeFutureProvider<List<Shop>> {
  /// See also [shopList].
  ShopListProvider({
    String? merchId,
  }) : this._internal(
          (ref) => shopList(
            ref as ShopListRef,
            merchId: merchId,
          ),
          from: shopListProvider,
          name: r'shopListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shopListHash,
          dependencies: ShopListFamily._dependencies,
          allTransitiveDependencies: ShopListFamily._allTransitiveDependencies,
          merchId: merchId,
        );

  ShopListProvider._internal(
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
  Override overrideWith(
    FutureOr<List<Shop>> Function(ShopListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShopListProvider._internal(
        (ref) => create(ref as ShopListRef),
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
  AutoDisposeFutureProviderElement<List<Shop>> createElement() {
    return _ShopListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShopListProvider && other.merchId == merchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, merchId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShopListRef on AutoDisposeFutureProviderRef<List<Shop>> {
  /// The parameter `merchId` of this provider.
  String? get merchId;
}

class _ShopListProviderElement
    extends AutoDisposeFutureProviderElement<List<Shop>> with ShopListRef {
  _ShopListProviderElement(super.provider);

  @override
  String? get merchId => (origin as ShopListProvider).merchId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
