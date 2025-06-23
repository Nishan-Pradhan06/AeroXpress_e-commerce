import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../../core/theme/app_theme.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  final List<({String title, String content})> details = const [
    (
      title: 'Are there mobile and portable options?',
      content:
          'Yes, Hotel_POS supports mobile and tablet devices, allowing you to manage your eCommerce store from anywhere.',
    ),
    (
      title: 'Can I get access to my financial report?',
      content:
          'Yes, Hotel_POS provides comprehensive financial reporting for your eCommerce business, including sales, revenue, expenses, and profit margins.',
    ),
    (
      title: 'How to recover my password? / How can I reset my password?',
      content:
          "Click 'Forgot Password' on the login screen and follow the steps sent to your registered email to reset your password securely.",
    ),
    (
      title: 'What happens after I download the Hotel_POS app?',
      content:
          "After downloading the app, you can set up your eCommerce store by adding products, setting pricing, and configuring shipping and payment options.",
    ),
    (
      title: 'How to get started with Hotel_POS?',
      content:
          'Once registered, follow the eCommerce setup guide to configure your product catalog, upload images, set taxes, and go live.',
    ),
    (
      title: 'How long will it take to register/sign in?',
      content:
          'Registration takes only a few minutes. You can sign in instantly using your email and password once your account is active.',
    ),
    (
      title: 'I forgot my password. How do I log into Hotel_POS?',
      content:
          "Click 'Forgot Password' and follow the prompts to reset it using the email linked to your eCommerce account.",
    ),
    (
      title:
          'My business uses the free version of this app. Can I still get support?',
      content:
          'Yes, even on the free tier, you have access to basic support for eCommerce setup and troubleshooting.',
    ),
    (
      title: 'Does Hotel_POS integrate with third-party services?',
      content:
          'Yes, it integrates with major shipping providers, payment gateways, marketing platforms, and accounting tools for eCommerce.',
    ),
    (
      title: 'Can I customize the interface to match my brand?',
      content:
          'Absolutely. You can customize your online storefront with your logo, colors, banners, and layout preferences.',
    ),
    (
      title: 'Is my data secure with Hotel_POS?',
      content:
          'Yes, all customer and transaction data is protected using advanced encryption and secure cloud infrastructure.',
    ),
    (
      title: 'What kind of training resources are available?',
      content:
          'You have access to video tutorials, setup wizards, help articles, and live webinars focused on launching and managing an eCommerce store.',
    ),
    (
      title: 'Can I manage multiple locations with Hotel_POS?',
      content:
          'Yes, you can manage multiple warehouses or eCommerce storefronts under one centralized dashboard.',
    ),
    (
      title: 'How often is Hotel_POS updated?',
      content:
          'Hotel_POS is updated regularly with new eCommerce features, performance enhancements, and security patches.',
    ),
    (
      title: 'What payment methods are supported?',
      content:
          'It supports credit cards, mobile payments, digital wallets, and integrations with popular online payment processors.',
    ),
    (
      title: 'Can I track inventory with Hotel_POS?',
      content:
          'Yes, you can track inventory across your eCommerce store, set low-stock alerts, and auto-update stock levels with every sale.',
    ),
    (
      title: 'Does Hotel_POS support online store integration?',
      content:
          'Yes, you can link your POS with platforms like Shopify, WooCommerce, or a custom web store for seamless sync.',
    ),
    (
      title: 'Can I manage both retail and eCommerce sales from one place?',
      content:
          'Yes, Hotel_POS lets you track and manage orders from both physical and online stores within a unified interface.',
    ),
    (
      title: 'Can I offer discounts and coupon codes?',
      content:
          'Absolutely. You can create discount rules, promo codes, and seasonal offers directly from the dashboard.',
    ),
    (
      title: 'Does Hotel_POS support shipping management?',
      content:
          'Yes, the system supports shipping rules, integrates with carriers, and allows real-time tracking updates for customers.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SingleChildScrollView(
      child: ShadAccordion<({String title, String content})>(
        children:
            details.map((detail) {
              return Padding(
                padding: const EdgeInsets.all(AppTheme.space2),
                child: ShadCard(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: ShadAccordionItem(
                    padding: EdgeInsets.all(AppTheme.space2),
                    separator: const SizedBox.shrink(),
                    value: detail,
                    title:
                        isMobile
                            ? SizedBox(
                              width: 300,
                              child: Text(
                                detail.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                            : Text(
                              detail.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    child: Text(
                      detail.content,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
