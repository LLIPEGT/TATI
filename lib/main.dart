import 'package:flutter/material.dart';
import 'package:projeto_flutter/common/config/dependencies.dart';
import 'package:projeto_flutter/common/themes/themes.dart';
import 'package:projeto_flutter/ui/pages/home_page.dart';

void main() {
  setupDependencies();
  
  runApp(MaterialApp(
    title: 'Student Id CArd',
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    theme: myTheme,
  ));
}
