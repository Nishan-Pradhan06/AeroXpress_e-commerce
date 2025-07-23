import 'package:deal_sell/core/widget/custom_button.dart';
import 'package:flutter/widgets.dart';

class NoInternetWidget extends StatelessWidget {
  final String? imageUrl;
  final String message;
  final dynamic Function()? onPressed;
  const NoInternetWidget({
    super.key,
    required this.message,
    this.imageUrl,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imageUrl != null) Image.asset(imageUrl ?? ''),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          CustomButtonPrimary(
            title: 'Retry',
            width: 100,
            height: 50,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
