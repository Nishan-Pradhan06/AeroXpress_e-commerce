part of 'on_boarding_cubit.dart';

class OnBoardingState extends Equatable {
  final String? onBoaringCompleted;

  const OnBoardingState({this.onBoaringCompleted});

  @override
  List<Object?> get props => [onBoaringCompleted];
}
