part of '../home_page.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.margin,
  });

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/menu.png',
              width: 28,
            ),
          ),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.png'),
          )
        ],
      ),
    );
  }
}
