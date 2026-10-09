import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/traverlo_colors.dart';

/// Borderless field for a [GlassCard]: small label on top, value below,
/// and a small icon button on the right.
class CardTextField extends StatelessWidget {
  const CardTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.trailingIcon,
    this.onTrailingTap,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onSubmitted,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData trailingIcon;
  final VoidCallback? onTrailingTap;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 8, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: TraverloColors.muted,
                  ),
                ),
                TextFormField(
                  controller: controller,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  onFieldSubmitted: onSubmitted,
                  validator: validator,
                  cursorColor: TraverloColors.blue,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: TraverloColors.text,
                    letterSpacing: obscureText ? 2 : 0,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: GoogleFonts.inter(
                      fontSize: 16,
                      color: TraverloColors.muted.withValues(alpha: 0.5),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.only(top: 8, bottom: 4),
                    border: InputBorder.none,
                    errorStyle: GoogleFonts.inter(
                      fontSize: 12,
                      color: TraverloColors.error,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onTrailingTap,
            icon: Icon(trailingIcon, size: 18),
            color: TraverloColors.muted,
          ),
        ],
      ),
    );
  }
}
