part of '../home_page.dart';

class RatesList extends StatelessWidget {
  const RatesList({
    super.key,
    required this.spacing,
  });

  final double spacing;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(spacing),
      itemCount: rates.length,
      itemBuilder: (context, index) {
        return RateRowWidget(
          item: rates[index],
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: spacing / 2,
      ),
    );
  }
}

class RateRowWidget extends StatelessWidget {
  const RateRowWidget({
    super.key,
    required this.item,
  });

  final RateItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              item.flagImage,
              width: 46,
              height: 46,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.currency,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: AppColors.currencyColor,
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 80,
                height: 40,
                child: MiniChart(
                  ratesHistory: item.rateHistory,
                  rateColor: item.rateColor,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                item.difference > 0
                    ? '+${item.difference}'
                    : '${item.difference}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: item.difference > 0
                      ? AppColors.positiveRate
                      : AppColors.negativeRate,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${item.rateInCents / 100}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              )
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class RateItem {
  final String flagImage;
  final String name;
  final String currency;
  final double difference;
  final double rateInCents;
  final List<double> rateHistory;
  final Color rateColor;

  RateItem({
    required this.flagImage,
    required this.name,
    required this.currency,
    required this.difference,
    required this.rateInCents,
    required this.rateHistory,
    required this.rateColor,
  });
}

List<RateItem> rates = [
  RateItem(
    flagImage: 'assets/images/flags/united-states.png',
    name: 'America',
    currency: 'USD',
    difference: 2,
    rateInCents: 597500,
    rateHistory: [
      500000,
      517500,
      507500,
      525500,
      520000,
      515500,
      565500,
      569500,
      574500,
      589000,
      599000,
      597500,
    ],
    rateColor: AppColors.usdRateColor,
  ),
  RateItem(
    flagImage: 'assets/images/flags/australia.png',
    name: 'Australia',
    currency: 'AUD',
    difference: -0.075,
    rateInCents: 547500,
    rateHistory: [
      607500,
      557500,
      567500,
      577500,
      537000,
      577000,
      527000,
      537000,
      557000,
      527000,
      547000,
      547500,
    ],
    rateColor: AppColors.audRateColor,
  ),
  RateItem(
    flagImage: 'assets/images/flags/canada.png',
    name: 'Canada',
    currency: 'CAD',
    difference: 1.05,
    rateInCents: 589520,
    rateHistory: [
      519520,
      539520,
      524520,
      564520,
      569520,
      559520,
      609520,
      579520,
      589520,
      569520,
      579520,
      589520,
    ],
    rateColor: AppColors.cadRateColor,
  ),
  RateItem(
    flagImage: 'assets/images/flags/hong-kong.png',
    name: 'Hong Kong',
    currency: 'HKD',
    difference: 1.05,
    rateInCents: 589520,
    rateHistory: [
      509520,
      529520,
      519520,
      549520,
      539520,
      549520,
      559520,
      542520,
      559520,
      569520,
      579520,
      589520,
    ],
    rateColor: AppColors.hkdRateColor,
  ),
];

class MiniChart extends StatelessWidget {
  const MiniChart({
    super.key,
    required this.ratesHistory,
    required this.rateColor,
  });

  final List<double> ratesHistory;
  final Color rateColor;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: ratesHistory.asMap().entries.map((e) {
              final index = e.key;
              final value = e.value;
              return FlSpot(
                index.toDouble(),
                value,
              );
            }).toList(),
            color: Colors.red,
            gradient: LinearGradient(
              colors: [
                rateColor.withOpacity(0.0),
                rateColor.withOpacity(1.0),
              ],
            ),
            dotData: const FlDotData(show: false),
            isCurved: true,
          ),
        ],
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(show: false),
        gridData: const FlGridData(show: false),
        lineTouchData: const LineTouchData(handleBuiltInTouches: false),
      ),
    );
  }
}
