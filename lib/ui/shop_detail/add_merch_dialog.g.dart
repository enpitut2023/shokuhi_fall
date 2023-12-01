// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_merch_dialog.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$merchOutlineListHash() => r'eae21b49642ae8c2c7185649426dedd9c9414d53';

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
String _$userMerchHash() => r'a9a6069d8e28af938861e6e10bea3328c9729474';

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
    r'ab883f3799ea1e35b4ac232991802563b24ab78a';

/// See also [SelectedMerchOutline].
@ProviderFor(SelectedMerchOutline)
final selectedMerchOutlineProvider =
    AutoDisposeNotifierProvider<SelectedMerchOutline, MerchOutline?>.internal(
  SelectedMerchOutline.new,
  name: r'selectedMerchOutlineProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedMerchOutlineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedMerchOutline = AutoDisposeNotifier<MerchOutline?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
