import 'package:dashboard_white_label/app/core/modules/root/root_Page.dart';
import 'package:dashboard_white_label/app/core/modules/root/root_store.dart';
import 'package:dashboard_white_label/app/modules/customize_app/customize_app_module.dart';
import 'package:dashboard_white_label/app/modules/main/main_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RootModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RootStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RootPage()),
    ModuleRoute("/customize-app", module: CustomizeAppModule()),
    ModuleRoute("/main", module: MainModule()),
  ];
}
