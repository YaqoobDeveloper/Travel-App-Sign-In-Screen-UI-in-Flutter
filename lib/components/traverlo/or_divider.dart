import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/traverlo_colors.dart';

/// Hairline — label — hairline.
class OrDivider extends StatelessWidget {
  const OrDivider({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final line = Expanded(
      child: Divider(color: Colors.white.withValues(alpha: 0.12)),
    );

    return Row(
      children: [
        line,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: GoogleFonts.inter(fontSize: 12, color: TraverloColors.muted),
          ),
        ),
        line,
      ],
    );
  }
}
