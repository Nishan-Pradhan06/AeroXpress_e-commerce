part of 'popular_product_bloc.dart';

@freezed
class PopularProductEvent with _$PopularProductEvent {
  const factory PopularProductEvent.started() = _Started;
}