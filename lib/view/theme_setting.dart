import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdcat_kawiish/bloc/common/theme/theme_bloc.dart';
import 'package:mdcat_kawiish/bloc/common/theme/theme_event.dart';
import 'package:mdcat_kawiish/bloc/common/theme/theme_state.dart';

class ThemeSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Settings'),
      ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Column(
            children: [
              ListTile(
                title: Text('System Mode'),
                leading: Icon(Icons.settings),
                trailing: Radio<ThemeModeEnum>(
                  value: ThemeModeEnum.system,
                  groupValue: state.themeMode,
                  onChanged: (newMode) {
                    context.read<ThemeBloc>().add(SetSystemMode());
                  },
                ),
              ),
              ListTile(
                title: Text('Light Mode'),
                leading: Icon(Icons.light_mode),
                trailing: Radio<ThemeModeEnum>(
                  value: ThemeModeEnum.light,
                  groupValue: state.themeMode,
                  onChanged: (newMode) {
                    if (newMode == ThemeModeEnum.light) {
                      context.read<ThemeBloc>().add(ToggleTheme());
                    }
                  },
                ),
              ),
              ListTile(
                title: Text('Dark Mode'),
                leading: Icon(Icons.dark_mode),
                trailing: Radio<ThemeModeEnum>(
                  value: ThemeModeEnum.dark,
                  groupValue: state.themeMode,
                  onChanged: (newMode) {
                    if (newMode == ThemeModeEnum.dark) {
                      context.read<ThemeBloc>().add(ToggleTheme());
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
