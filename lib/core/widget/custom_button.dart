import 'package:flutter/material.dart';

class CustomButtonPrimary extends StatelessWidget {
  final double? height;
  final double? width;
  final String title;
  final Function()? onPressed;
  final bool isLoading;
  final Widget? leadingIcon;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButtonPrimary({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.width = double.maxFinite,
    this.height = 50,
    this.leadingIcon,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? colorScheme.primary,
          foregroundColor: textColor ?? colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child:
            isLoading
                ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leadingIcon != null) ...[
                      leadingIcon!,
                      const SizedBox(width: 8),
                    ],
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: textColor ?? colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}

class CustomButtonOutline extends StatelessWidget {
  final double? height;
  final double? width;
  final String title;
  final Function()? onPressed;
  final bool isLoading;
  final Widget? leadingIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  const CustomButtonOutline({
    super.key,
    required this.title,
    this.onPressed,
    this.height = 50,
    this.width = double.maxFinite,
    this.isLoading = false,
    this.leadingIcon,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor ?? colorScheme.primary),
          backgroundColor: backgroundColor,
          foregroundColor: textColor ?? colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child:
            isLoading
                ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: textColor ?? colorScheme.primary,
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leadingIcon != null) ...[
                      leadingIcon!,
                      const SizedBox(width: 8),
                    ],
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: textColor ?? colorScheme.primary,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool isLoading;
  final TextStyle? textStyle;
  final Widget? leadingIcon;
  final Color? textColor;

  const CustomTextButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.textStyle,
    this.leadingIcon,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor ?? colorScheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child:
          isLoading
              ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: textColor ?? colorScheme.primary,
                ),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leadingIcon != null) ...[
                    leadingIcon!,
                    const SizedBox(width: 8),
                  ],
                  Text(
                    title,
                    style:
                        textStyle ??
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: textColor ?? colorScheme.primary,
                        ),
                  ),
                ],
              ),
    );
  }
}
