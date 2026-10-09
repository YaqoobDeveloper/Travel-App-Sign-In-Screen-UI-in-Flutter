import 'package:flutter/material.dart';

import 'card_text_field.dart';

/// [CardTextField] whose lock icon shows / hides the password.
class CardPasswordField extends StatefulWidget {
  const CardPasswordField({
    super.key,
    required this.controller,
    this.label = 'Password',
    this.onSubmitted,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;

  @override
  State<CardPasswordField> createState() => _CardPasswordFieldState();
}

class _CardPasswordFieldState extends State<CardPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return CardTextField(
      controller: widget.controller,
      label: widget.label,
      hint: '••••••••',
      obscureText: _obscure,
      textInputAction: TextInputAction.done,
      onSubmitted: widget.onSubmitted,
      validator: widget.validator,
      trailingIcon: _obscure ? Icons.lock_outline : Icons.lock_open_outlined,
      onTrailingTap: () => setState(() => _obscure = !_obscure),
    );
  }
}
