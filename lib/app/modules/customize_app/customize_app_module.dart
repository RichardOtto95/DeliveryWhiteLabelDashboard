import 'package:flutter_modular/flutter_modular.dart';

import 'customize_app_page.dart';
import 'customize_app_store.dart';

class CustomizeAppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CustomizeAppStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CustomizeAppPage()),
  ];
}
