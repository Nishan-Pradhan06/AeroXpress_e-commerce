part of 'recently_added_products_bloc.dart';

@freezed
class RecentlyAddedProductsEvent with _$RecentlyAddedProductsEvent {
  const factory RecentlyAddedProductsEvent.started() = _Started;
}