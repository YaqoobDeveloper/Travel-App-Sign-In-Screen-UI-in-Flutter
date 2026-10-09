import 'package:flutter/material.dart';

import '../../theme/traverlo_colors.dart';

/// Dark translucent card that stacks its children with hairline dividers.
class GlassCard extends StatelessWidget {
  const GlassCard({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TraverloColors.card.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0)
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white.withValues(alpha: 0.07),
              ),
            children[i],
          ],
        ],
      ),
    );
  }
}
