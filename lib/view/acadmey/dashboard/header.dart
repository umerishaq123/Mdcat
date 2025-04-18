import 'package:mdcat_kawiish/all_imports.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            "Dashboard",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Spacer(flex: 1),
        // const Expanded(child: SearchField()),
        // const ProfileCard(),
        const ChangeThemeWidget()
      ],
    );
  }
}

const defaultPadding = 16.0;

// class ProfileCard extends StatelessWidget {
//   const ProfileCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: defaultPadding),
//       padding: const EdgeInsets.symmetric(
//         horizontal: defaultPadding,
//         vertical: defaultPadding / 2,
//       ),
//       decoration: BoxDecoration(
//         color: ThemeState().themeMode == ThemeModeEnum.light
//             ? Themecolor.white
//             : Themecolor.grey,
//         borderRadius: const BorderRadius.all(Radius.circular(10)),
//         border: Border.all(color: Colors.white10),
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.person),
//           // Hide it on Mobile
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
//             child: Text("Subreen Adam"),
//           ),
//           const Icon(
//             Icons.keyboard_arrow_down,
//             color: Colors.black,
//           ),
//         ],
//       ),
//     );
//   }
// }

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.themeSettingForTeacher);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            decoration: BoxDecoration(
              color: state.themeMode == ThemeModeEnum.light
                  ? Themecolor.white
                  : Themecolor.grey,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.white10),
            ),
            margin:const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(state.themeMode == ThemeModeEnum.light
                    ? Icons.dark_mode_rounded
                    : Icons.light_mode_outlined),
                const Text('Change Theme')
              ],
            ),
          ),
        );
      },
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Themecolor.white,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            // margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: const BoxDecoration(
              color: Themecolor.primary,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
