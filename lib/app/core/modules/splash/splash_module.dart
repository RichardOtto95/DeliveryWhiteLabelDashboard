import 'package:dashboard_white_label/app/core/modules/splash/splash_Page.dart';
import 'package:dashboard_white_label/app/core/modules/splash/splash_store.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends WidgetModule {
  SplashModule({Key? key}) : super(key: key);

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashStore()),
  ];

  @override
  Widget get view => const SplashPage();
}
