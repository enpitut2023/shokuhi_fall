// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merch_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$merchListHash() => r'daabf24fbc7ed7f0f0bc6629e75eca2a03f3a9d8';

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

/// See also [merchList].
@ProviderFor(merchList)
const merchListProvider = MerchListFamily();

/// See also [merchList].
class MerchListFamily extends Family<AsyncValue<List<Merch>>> {
  /// See also [merchList].
  const MerchListFamily();

  /// See also [merchList].
  MerchListProvider call({
    String? shopId,
  }) {
    return MerchListProvider(
      shopId: shopId,
    );
  }

  @override
  MerchListProvider getProviderOverride(
    covariant MerchListProvider provider,
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
  String? get name => r'merchListProvider';
}

/// See also [merchList].
class MerchListProvider extends AutoDisposeFutureProvider<List<Merch>> {
  /// See also [merchList].
  MerchListProvider({
    String? shopId,
  }) : this._internal(
          (ref) => merchList(
            ref as MerchListRef,
            shopId: shopId,
          ),
          from: merchListProvider,
          name: r'merchListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$merchListHash,
          dependencies: MerchListFamily._dependencies,
          allTransitiveDependencies: MerchListFamily._allTransitiveDependencies,
          shopId: shopId,
        );

  MerchListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shopId,
  }) : super.internal();

  final String? shopId;

  @override
  Override overrideWith(
    FutureOr<List<Merch>> Function(MerchListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MerchListProvider._internal(
        (ref) => create(ref as MerchListRef),
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
  AutoDisposeFutureProviderElement<List<Merch>> createElement() {
    return _MerchListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MerchListProvider && other.shopId == shopId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MerchListRef on AutoDisposeFutureProviderRef<List<Merch>> {
  /// The parameter `shopId` of this provider.
  String? get shopId;
}

class _MerchListProviderElement
    extends AutoDisposeFutureProviderElement<List<Merch>> with MerchListRef {
  _MerchListProviderElement(super.provider);

  @override
  String? get shopId => (origin as MerchListProvider).shopId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
