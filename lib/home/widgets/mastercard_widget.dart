part of '../home_page.dart';

class MastercardWidget extends StatelessWidget {
  const MastercardWidget({
    super.key,
    required this.margin,
  });

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: AspectRatio(
        aspectRatio: 1.7,
        child: LayoutBuilder(builder: (context, constraints) {
          final cardWidth = constraints.maxWidth;
          final cardHeight = constraints.maxHeight;
          return Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.cardGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Current Balance',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    const Text(
                      '\$5,750.20',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0,
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/stats.png',
                          width: 24,
                        ),
                        const SizedBox(width: 6),
                        const Text('Stats'),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/mastercard_logo.png',
                        width: 62,
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        width: cardWidth * 0.45,
                        height: cardHeight * 0.2,
                        child: MaterialButton(
                          onPressed: () => Navigator.of(context).push(
                            FadeRoute(
                              builder: (context) => const ExchangePage(),
                            ),
                          ),
                          color: AppColors.buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    'assets/images/exchange_icon.png',
                                    width: 16,
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text('Exchange'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
