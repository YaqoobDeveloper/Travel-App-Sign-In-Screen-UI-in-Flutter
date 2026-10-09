import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/traverlo_colors.dart';

/// Teal badge with the first letter, followed by the brand name.
class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 38,
          height: 38,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: TraverloColors.teal,
            shape: BoxShape.circle,
          ),
          child: Text(
            name[0],
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          name,
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: TraverloColors.text,
          ),
        ),
      ],
    );
  }
}
