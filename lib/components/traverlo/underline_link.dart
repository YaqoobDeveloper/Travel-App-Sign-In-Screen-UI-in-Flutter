import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/traverlo_colors.dart';

/// Small underlined text link, like "Sign up".
class UnderlineLink extends StatelessWidget {
  const UnderlineLink({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: TraverloColors.muted,
              decoration: TextDecoration.underline,
              decorationColor: TraverloColors.muted,
            ),
          ),
        ),
      ),
    );
  }
}
