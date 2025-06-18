import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/once_cache_service.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  final OnceCacheService _onceCacheService;

  OnBoardingCubit({required OnceCacheService onceService})
    : _onceCacheService = onceService,
      super(OnBoardingState());

  void setOnBoarding() async {
    try {
      await _onceCacheService.setOnBoardingCache();
      emit(OnBoardingState(onBoaringCompleted: 'success'));
    } catch (e) {
      emit(OnBoardingState(onBoaringCompleted: null));
    }
  }

  void getOnBoarding() async {
    try {
      final getOnBoarding = await _onceCacheService.getOnBoardingCache();
      emit(OnBoardingState(onBoaringCompleted: getOnBoarding));
    } catch (e) {
      emit(OnBoardingState(onBoaringCompleted: null));
    }
  }
}
