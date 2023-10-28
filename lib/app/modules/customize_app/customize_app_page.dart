import 'dart:io';

import 'package:dashboard_white_label/app/core/models/app_theme_preferences.dart';
import 'package:dashboard_white_label/app/shared/utilities.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dashboard_white_label/app/modules/customize_app/customize_app_store.dart';
import 'package:flutter/material.dart';

import 'widgets/get_color_tab.dart';
import 'widgets/get_text_tab.dart';

class CustomizeAppPage extends StatefulWidget {
  const CustomizeAppPage({Key? key}) : super(key: key);
  @override
  CustomizeAppPageState createState() => CustomizeAppPageState();
}

class CustomizeAppPageState extends State<CustomizeAppPage> {
  final CustomizeAppStore store = Modular.get();

  // ThemeData theme = ThemeData();

  AppThemePreferences? preferences;

  late ColorScheme colorScheme;

  late TextStylePreferences textStyles;

  late AppBarParams appBarParams;

  late ColorsPreferences colors;

  final brightness = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
      .platformBrightness;

  File? logotipo;

  File? logo;

  File? typography;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      colors = ColorsPreferences(context);

      brightness == Brightness.light
          ? colorScheme = ColorScheme(
              brightness: brightness,
              primary: colors.primaryLight!,
              onPrimary: colors.onPrimaryLight!,
              secondary: colors.secondaryLight!,
              onSecondary: colors.onSecondaryLight!,
              error: colors.errorLight!,
              onError: colors.onErrorLight!,
              background: colors.backgroundLight!,
              onBackground: colors.onBackgroundLight!,
              surface: colors.surfaceLight!,
              onSurface: colors.onSurfaceLight!,
            )
          : colorScheme = ColorScheme(
              brightness: brightness,
              primary: colors.primaryDark!,
              onPrimary: colors.primaryDark!,
              secondary: colors.secondaryDark!,
              onSecondary: colors.secondaryDark!,
              error: colors.errorDark!,
              onError: colors.errorDark!,
              background: colors.backgroundDark!,
              onBackground: colors.backgroundDark!,
              surface: colors.surfaceDark!,
              onSurface: colors.surfaceDark!,
            );

      textStyles = TextStylePreferences(context);

      appBarParams = AppBarParams();

      preferences = AppThemePreferences(
        context: context,
        storeName: "Nome da sua loja",
        colors: colors,
        textStylePreferences: textStyles,
        appBarParams: appBarParams,
      );
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (preferences != null) {
      final pref = preferences!;
      colors = pref.colors;
      ThemeData themeData = pref.toThemeData();
      return MaterialApp(
        theme: pref.toThemeData(),
        home: Scaffold(
          backgroundColor: colors.backgroundDark,
          appBar: AppBar(
            title: Text(
              pref.appBarParams.title,
              style: TextStyle(color: themeData.colorScheme.onBackground),
            ),
            backgroundColor: themeData.colorScheme.primary,
          ),
          body: Column(
            children: <Widget>[
              GetTextTab(
                label: "Nome da loja:",
                hint: "Nome da loja",
                onChanged: (txt) => setState(() {
                  preferences!.storeName = txt;
                  preferences!.appBarParams.title = txt;
                }),
              ),
              GetColorTab(
                label: "Cor primária clara",
                onLabel: "Na cor primária clara",
                color: pref.colors.primaryLight!,
                onColor: pref.colors.onPrimaryLight!,
                pickColor: (clr) {
                  print("get Cor primária clara: ${clr.value}");
                  setState(() {
                    preferences!.colors.primaryLight = clr;
                  });
                },
                pickOnColor: (clr) {
                  setState(() {
                    preferences!.colors.onPrimaryLight = clr;
                  });
                },
              ),
              GetColorTab(
                label: "Cor secundária clara",
                onLabel: "Na cor secundária clara",
                color: pref.colors.secondaryLight!,
                onColor: pref.colors.onSecondaryLight!,
                pickColor: (clr) {
                  setState(() {
                    preferences!.colors.secondaryLight = clr;
                  });
                },
                pickOnColor: (clr) {
                  setState(() {
                    preferences!.colors.onSecondaryLight = clr;
                  });
                },
              ),
              GetColorTab(
                label: "Cor de fundo clara",
                onLabel: "Na cor de fundo clara",
                color: pref.colors.backgroundLight!,
                onColor: pref.colors.onBackgroundLight!,
                pickColor: (clr) {
                  setState(() {
                    preferences!.colors.backgroundLight = clr;
                  });
                },
                pickOnColor: (clr) {
                  setState(() {
                    preferences!.colors.onBackgroundLight = clr;
                  });
                },
              ),
              GetColorTab(
                label: "Cor de superfície clara",
                onLabel: "Na cor de superficie clara",
                color: pref.colors.surfaceLight!,
                onColor: pref.colors.onSurfaceLight!,
                pickColor: (clr) {
                  setState(() {
                    preferences!.colors.surfaceLight = clr;
                  });
                },
                pickOnColor: (clr) {
                  setState(() {
                    preferences!.colors.onSurfaceLight = clr;
                  });
                },
              ),
              GetColorTab(
                label: "Cor primária escura",
                onLabel: "Na cor primária escura",
                color: pref.colors.primaryDark!,
                onColor: pref.colors.onPrimaryDark!,
                pickColor: (clr) {
                  print("get Cor primária escura: ${clr.value}");
                  setState(() {
                    preferences!.colors.primaryDark = clr;
                  });
                },
                pickOnColor: (clr) {
                  setState(() {
                    preferences!.colors.onPrimaryDark = clr;
                  });
                },
              ),
              GetColorTab(
                label: "Cor secundária escura",
                onLabel: "Na cor secundária escura",
                color: pref.colors.secondaryDark!,
                onColor: pref.colors.onSecondaryDark!,
                pickColor: (clr) {
                  setState(() {
                    preferences!.colors.secondaryDark = clr;
                  });
                },
                pickOnColor: (clr) {
                  setState(() {
                    preferences!.colors.onSecondaryDark = clr;
                  });
                },
              ),
              GetColorTab(
                label: "Cor de fundo escura",
                onLabel: "Na cor de fundo escura",
                color: pref.colors.backgroundDark!,
                onColor: pref.colors.onBackgroundDark!,
                pickColor: (clr) {
                  setState(() {
                    preferences!.colors.backgroundDark = clr;
                  });
                },
                pickOnColor: (clr) {
                  setState(() {
                    preferences!.colors.onBackgroundDark = clr;
                  });
                },
              ),
              GetColorTab(
                label: "Cor de superfície escura",
                onLabel: "Na cor de superficie escura",
                color: pref.colors.surfaceDark!,
                onColor: pref.colors.onSurfaceDark!,
                pickColor: (clr) {
                  setState(() {
                    preferences!.colors.surfaceDark = clr;
                  });
                },
                pickOnColor: (clr) {
                  setState(() {
                    preferences!.colors.onSurfaceDark = clr;
                  });
                },
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}

class GetFileTab extends StatelessWidget {
  const GetFileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
