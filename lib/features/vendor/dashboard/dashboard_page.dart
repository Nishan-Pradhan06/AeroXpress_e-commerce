import 'package:flutter/material.dart';
import 'widget/stats_overview.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Material(
          elevation: 0.1,
          color: Colors.white,
          child: AppBar(
            centerTitle: false,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Dashboard", style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
          EvStatsOverview(),
          
          ]),
      ),
    );
  }
}
