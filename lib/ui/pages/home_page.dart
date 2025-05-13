import 'package:flutter/material.dart';
import 'package:projeto_flutter/common/config/dependencies.dart';
import 'package:projeto_flutter/ui/controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late HomePageController viewController;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    viewController = injector.get<HomePageController>();
    viewController.load.execute();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cartão do Estudante',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
            tooltip: 'Edit Information',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
            tooltip: 'Reset Information',
          ),
        ],
      ),
    );
  }
}
