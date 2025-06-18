import 'package:flutter/material.dart';
import 'contact_tab_screen.dart';
import 'faq_tab_screen.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Material(
            elevation: 0.1,
            color: Colors.white,
            child: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Help Center",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              bottom: TabBar(
                tabs: [Tab(text: 'FAQs'), Tab(text: 'Contact Us')],
              ),
            ),
          ),
        ),
        body: TabBarView(children: [FaqsScreen(), ContactTabScreen()]),
      ),
    );
  }
}
