import 'package:deal_sell/features/shared/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:deal_sell/routes/app_route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../core/dl/dependency_injection.dart';
import '../../../core/theme/app_colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Purchase Online !!",
      "subtitle":
          "Browse a wide range of products and place your order easily from the comfort of your home.",
      "image": "assets/image/purchase_online.png",
      "onBoarding": "assets/image/shape1.png",
    },
    {
      "title": "Track Order !!",
      "subtitle":
          "Stay updated with real-time tracking and know exactly when your package will arrive.",
      "image": "assets/image/track_order.png",
      "onBoarding": "assets/image/shape2.png",
    },
    {
      "title": "Get Your Order !!",
      "subtitle":
          "Receive your order at your doorstep quickly and securely with our trusted delivery service.",
      "image": "assets/image/get_your_order.png",
      "onBoarding": "assets/image/shape3.png",
    },
  ];

  void _onBoardingEnd() {
    sl<OnBoardingCubit>().setOnBoarding();
    context.goNamed(AppRoutesName.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder:
                (context, index) => OnBoardingContent(
                  title: onboardingData[index]['title']!,
                  subtitle: onboardingData[index]['subtitle']!,
                  image: onboardingData[index]['image']!,
                  onBoarding: onboardingData[index]['onBoarding']!,
                ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            right: 0,
            child: SizedBox(
              height: 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          onboardingData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SizedBox(
                      width: 40,
                      child: Center(
                        child: Visibility(
                          visible: _currentPage >= onboardingData.length - 1,
                          child: ShadIconButton(
                            onPressed: () {
                              _onBoardingEnd();
                            },
                            icon: Icon(Icons.arrow_forward_ios, size: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? brandPrimaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  final String title, subtitle, image, onBoarding;

  const OnBoardingContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onBoarding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          onBoarding,
          // height: 100,
          // width: MediaQuery.of(context).size.width,
          // fit: BoxFit.cover,
        ),

        const SizedBox(height: 40),
        Expanded(child: Image.asset(image, height: 200, width: 200)),
        const SizedBox(height: 40),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}
