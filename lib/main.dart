import 'package:flutter/material.dart';

import 'data/mapper/mapper_configuration.dart';
import 'hive_register.dart';
import 'injection_container.dart';
import 'presentation/ui/application.dart';

void main() async {
  InjectionContainer().initialize();

  MapperConfiguration().initialize();

  await HiveRegister().register();

  runApp(const Application());
}
