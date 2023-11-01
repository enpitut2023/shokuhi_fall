// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merch_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$merchListHash() => r'c916eba8a4763a752f1f647668555e46836d735d';

/// See also [merchList].
@ProviderFor(merchList)
final merchListProvider = AutoDisposeFutureProvider<List<Merch>>.internal(
  merchList,
  name: r'merchListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$merchListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MerchListRef = AutoDisposeFutureProviderRef<List<Merch>>;
String _$selectedMerchListHash() => r'9e9c604fde2537713c984fc99ff876af93720a91';

/// See also [SelectedMerchList].
@ProviderFor(SelectedMerchList)
final selectedMerchListProvider =
    AutoDisposeNotifierProvider<SelectedMerchList, List<Merch>>.internal(
  SelectedMerchList.new,
  name: r'selectedMerchListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedMerchListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedMerchList = AutoDisposeNotifier<List<Merch>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
