import 'package:codeli/core/core.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String placeholder;
  const InputWidget({super.key, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: AppTextStyles.body16,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: AppColors.border),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(
                color: AppColors.primary,
                width: 2), // Adiciona uma borda quando o campo está em foco
          ),
          hintText: placeholder,
          hintStyle: AppTextStyles.body16,
        ));
  }
}
