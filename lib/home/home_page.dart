import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge_10/app_colors.dart';
import 'package:ui_challenge_10/exchange/exchange_page.dart';
import 'package:ui_challenge_10/fade_route.dart';

part 'widgets/mastercard_widget.dart';

part 'widgets/top_bar.dart';

part 'widgets/rates.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const spacing = 32.0;
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: spacing),
          TopBar(
            margin: EdgeInsets.symmetric(
              horizontal: spacing,
            ),
          ),
          SizedBox(height: spacing),
          MastercardWidget(
            margin: EdgeInsets.symmetric(
              horizontal: spacing,
            ),
          ),
          SizedBox(height: spacing),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing),
            child: Text(
              "Today's Rates",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: RatesList(
              spacing: spacing,
            ),
          ),
        ],
      ),
    );
  }
}
