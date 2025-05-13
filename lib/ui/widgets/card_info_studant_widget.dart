import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/domain/entities/studant_info_entity.dart';

class StudantCard extends StatelessWidget {
  final StudentInfoEntity student;
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  StudantCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: FlipCard(
        key: cardKey,
        direction: FlipDirection.HORIZONTAL,
        speed: 500,
        flipOnTouch: true,
        front: _buildCard(
          context,
          isFront: true,
        ),
        back: _buildCard(
          context,
          isFront: false,
        ),
      ),
    );
  }

  _buildCard(BuildContext context, {bool isFront = true}) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.inverseSurface,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ]),
      child: isFront ? _buildCardFront(context) : _buildCardBack(context),
    );
  }

  _buildCardFront(BuildContext context) {
    final theme = Theme.of(context);
    var colorText = Colors.white;

    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DADOS DO ESTUDANTE',
              style: TextStyle(color: theme.colorScheme.tertiary),
            )
          ],
        )
      );
  }

  _buildCardBack(BuildContext context) {}
}
