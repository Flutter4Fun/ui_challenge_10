import 'package:flutter/material.dart';
import 'package:ui_challenge_10/app_colors.dart';

part 'widgets/exchange_section.dart';

part 'widgets/numpad_section.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exchange'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Column(
        children: [
          Expanded(
            flex: 1,
            child: ExchangeSection(),
          ),
          Expanded(
            flex: 2,
            child: NumPadSection(),
          ),
          Button(),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 30,
      ),
      width: double.infinity,
      height: 80,
      child: MaterialButton(
        onPressed: () {},
        color: AppColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text('Exchange'),
        ),
      ),
    );
  }
}
