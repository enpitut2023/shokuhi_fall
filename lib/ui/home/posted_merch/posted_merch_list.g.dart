// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posted_merch_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postedMerchListHash() => r'9b24845dee4a19d7c4d6f74b58b0056b1197af7a';

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

/// See also [postedMerchList].
@ProviderFor(postedMerchList)
const postedMerchListProvider = PostedMerchListFamily();

/// See also [postedMerchList].
class PostedMerchListFamily extends Family<AsyncValue<List<PostedMerch>>> {
  /// See also [postedMerchList].
  const PostedMerchListFamily();

  /// See also [postedMerchList].
  PostedMerchListProvider call({
    required String shopId,
    required String merchDetailId,
  }) {
    return PostedMerchListProvider(
      shopId: shopId,
      merchDetailId: merchDetailId,
    );
  }

  @override
  PostedMerchListProvider getProviderOverride(
    covariant PostedMerchListProvider provider,
  ) {
    return call(
      shopId: provider.shopId,
      merchDetailId: provider.merchDetailId,
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
  String? get name => r'postedMerchListProvider';
}

/// See also [postedMerchList].
class PostedMerchListProvider
    extends AutoDisposeFutureProvider<List<PostedMerch>> {
  /// See also [postedMerchList].
  PostedMerchListProvider({
    required String shopId,
    required String merchDetailId,
  }) : this._internal(
          (ref) => postedMerchList(
            ref as PostedMerchListRef,
            shopId: shopId,
            merchDetailId: merchDetailId,
          ),
          from: postedMerchListProvider,
          name: r'postedMerchListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postedMerchListHash,
          dependencies: PostedMerchListFamily._dependencies,
          allTransitiveDependencies:
              PostedMerchListFamily._allTransitiveDependencies,
          shopId: shopId,
          merchDetailId: merchDetailId,
        );

  PostedMerchListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shopId,
    required this.merchDetailId,
  }) : super.internal();

  final String shopId;
  final String merchDetailId;

  @override
  Override overrideWith(
    FutureOr<List<PostedMerch>> Function(PostedMerchListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostedMerchListProvider._internal(
        (ref) => create(ref as PostedMerchListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        shopId: shopId,
        merchDetailId: merchDetailId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PostedMerch>> createElement() {
    return _PostedMerchListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostedMerchListProvider &&
        other.shopId == shopId &&
        other.merchDetailId == merchDetailId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);
    hash = _SystemHash.combine(hash, merchDetailId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostedMerchListRef on AutoDisposeFutureProviderRef<List<PostedMerch>> {
  /// The parameter `shopId` of this provider.
  String get shopId;

  /// The parameter `merchDetailId` of this provider.
  String get merchDetailId;
}

class _PostedMerchListProviderElement
    extends AutoDisposeFutureProviderElement<List<PostedMerch>>
    with PostedMerchListRef {
  _PostedMerchListProviderElement(super.provider);

  @override
  String get shopId => (origin as PostedMerchListProvider).shopId;
  @override
  String get merchDetailId => (origin as PostedMerchListProvider).merchDetailId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
