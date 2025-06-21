import 'package:bloc/bloc.dart';
import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recently_added_products_event.dart';
part 'recently_added_products_state.dart';
part '../../bloc/bloc/recently_added_products_bloc.freezed.dart';

class RecentlyAddedProductsBloc extends Bloc<RecentlyAddedProductsEvent, RecentlyAddedProductsState> {
  RecentlyAddedProductsBloc() : super(_Initial()) {
    on<RecentlyAddedProductsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
