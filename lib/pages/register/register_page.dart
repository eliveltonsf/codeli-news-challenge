import 'package:codeli/core/core.dart';
import 'package:codeli/shared/widgets/button_widget/button_widget.dart';
import 'package:codeli/shared/widgets/input_widget/input_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.register), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: const BoxDecoration(gradient: AppGradients.linear),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Novo cadastro",
                      style: AppTextStyles.heading30Primary,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: InputWidget(placeholder: 'Nome de usuário'),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: InputWidget(placeholder: 'E-mail'),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: InputWidget(placeholder: 'Senha'),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: InputWidget(placeholder: 'Confirmar Senha'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 16),
                      child: ButtonWidget.primary(
                        label: "Cadastrar",
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Text(
                    "Voltar",
                    style: AppTextStyles.body16White,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
