// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merch_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$merchListHash() => r'5b1c8f62a85720f34e0417f7079a370db5869fb1';

/// See also [merchList].
@ProviderFor(merchList)
final merchListProvider =
    AutoDisposeFutureProvider<List<MerchOutline>>.internal(
  merchList,
  name: r'merchListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$merchListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MerchListRef = AutoDisposeFutureProviderRef<List<MerchOutline>>;
String _$tagListHash() => r'1f2ecd6c91839b8ee24d2357183a8783d0e7e3ed';

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
String _$selectedMerchListHash() => r'3915778bdfa07946b7efc525c5981f867ce3746c';

/// See also [SelectedMerchList].
@ProviderFor(SelectedMerchList)
final selectedMerchListProvider =
    AutoDisposeNotifierProvider<SelectedMerchList, List<MerchOutline>>.internal(
  SelectedMerchList.new,
  name: r'selectedMerchListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedMerchListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedMerchList = AutoDisposeNotifier<List<MerchOutline>>;
String _$selectedTagHash() => r'3a7177ac2c5b60e6c3b74504eb89cc67e5beceab';

/// See also [SelectedTag].
@ProviderFor(SelectedTag)
final selectedTagProvider =
    AutoDisposeNotifierProvider<SelectedTag, String?>.internal(
  SelectedTag.new,
  name: r'selectedTagProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedTagHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedTag = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
