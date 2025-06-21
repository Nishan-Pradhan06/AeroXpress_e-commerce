import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'popular_product_event.dart';
part 'popular_product_state.dart';
part '../../bloc/bloc/popular_product_bloc.freezed.dart';

class PopularProductBloc extends Bloc<PopularProductEvent, PopularProductState> {
  PopularProductBloc() : super(_Initial()) {
    on<PopularProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
