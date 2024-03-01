import 'package:codeli/core/core.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String placeholder;
  final TextInputType type;
  final TextEditingController controller;
  final Function(String) validator;

  const InputWidget({
    super.key,
    required this.placeholder,
    required this.type,
    required this.controller,
    required this.validator,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type,
      controller: widget.controller,
      obscureText:
          widget.type == TextInputType.visiblePassword ? _isObscured : false,
      cursorColor: AppColors.grey,
      style: AppTextStyles.body16,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 10.0),
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
        hintText: widget.placeholder,
        hintStyle: AppTextStyles.body16,
        suffixIcon: widget.type == TextInputType.visiblePassword
            ? IconButton(
                icon: _isObscured
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,
      ),
      validator: (value) => widget.validator(value!),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
