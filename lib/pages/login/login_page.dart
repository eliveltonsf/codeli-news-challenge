import 'package:codeli/core/core.dart';
import 'package:codeli/pages/forgot_password/forgot_password_page.dart';
import 'package:codeli/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:codeli/shared/widgets/button_widget/button_widget.dart';
import 'package:codeli/shared/widgets/input_widget/input_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.backgroundlogin), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: const BoxDecoration(gradient: AppGradients.linear),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(AppImages.logo),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Seja bem-vindo!",
                      style: AppTextStyles.heading30Primary,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Aqui você vai poder postar, avaliar e ter acesso à localização de suas postagens!",
                      style: AppTextStyles.body16White,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: InputWidget(placeholder: 'E-mail'),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: InputWidget(placeholder: 'Senha'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ButtonWidget.primary(
                        label: "Login",
                        onTap: () {},
                      ),
                    ),
                    ButtonWidget.transparent(
                      label: "esqueceu sua senha?",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                ButtonWidget.transparentPrimary(
                  label: "Cadastre-se",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
