import 'package:mdcat_kawiish/all_imports.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final Icon icon;
  final VoidCallback press;

  const DrawerListTile({
    required this.title,
    required this.icon,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: icon,
      title: Row(
        children: [
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(color: Themecolor.white),
          ),
        ],
      ),
    );
  }
}
