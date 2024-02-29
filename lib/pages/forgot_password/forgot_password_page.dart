import 'package:codeli/core/core.dart';
import 'package:codeli/shared/widgets/button_widget/button_widget.dart';
import 'package:codeli/shared/widgets/input_widget/input_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.forgotpassword), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: const BoxDecoration(gradient: AppGradients.linear),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: double.minPositive,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Esqueceu sua senha?",
                      style: AppTextStyles.heading30Primary,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Envie uma solicitação de redefinição de senha, basta inserir seu e-mail e prossegui com os passos recebidos no e-mail!",
                      style: AppTextStyles.body16White,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: InputWidget(placeholder: 'E-mail'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 16),
                      child: ButtonWidget.primary(
                        label: "Enviar",
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Text(
                          "Voltar",
                          style: AppTextStyles.body16White,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget.transparentPrimary(
                        label: "Cadastre-se",
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
