import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// STATE
class FabState extends Equatable {
  final bool isExtended;

  const FabState({required this.isExtended});

  @override
  List<Object> get props => [isExtended];
}

// CUBIT
class FabCubit extends Cubit<FabState> {
  FabCubit() : super(const FabState(isExtended: true));

  void extend() => emit(const FabState(isExtended: true));
  void shrink() => emit(const FabState(isExtended: false));
}
