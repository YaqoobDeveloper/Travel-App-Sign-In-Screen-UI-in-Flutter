import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/traverlo_colors.dart';

/// Dark pill with an icon, a label and a radio dot. The selected tile
/// gets a glowing blue outline.
class SocialOptionTile extends StatelessWidget {
  const SocialOptionTile({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 58,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: TraverloColors.card.withValues(alpha: 0.75),
            borderRadius: BorderRadius.circular(29),
            border: Border.all(
              color: selected ? TraverloColors.blue : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              if (selected)
                BoxShadow(
                  color: TraverloColors.blue.withValues(alpha: 0.35),
                  blurRadius: 16,
                ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(width: 36, height: 36, child: Center(child: icon)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: TraverloColors.text,
                  ),
                ),
              ),
              _RadioDot(selected: selected),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  const _RadioDot({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? TraverloColors.blue : TraverloColors.muted,
          width: selected ? 4 : 1.5,
        ),
      ),
    );
  }
}
