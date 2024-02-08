part of '../exchange_page.dart';

class NumPadSection extends StatelessWidget {
  const NumPadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: List.generate(4, (row) {
          return Expanded(
            child: Row(
              children: List.generate(3, (col) {
                final cellNumber = row * 3 + col + 1;
                const visibleSide = BorderSide(
                  width: 2,
                  color: AppColors.dividerColor,
                );
                const hiddenSide = BorderSide(
                  width: 0,
                  color: Colors.transparent,
                );
                return Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: row == 3 ? hiddenSide : visibleSide,
                          right: col == 2 ? hiddenSide : visibleSide,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          switch (cellNumber) {
                            10 => '.',
                            11 => '0',
                            12 => 'x',
                            _ => '$cellNumber',
                          },
                          style: const TextStyle(
                            fontSize: 30,
                            color: AppColors.textColor2,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
