import 'package:codeli/core/core.dart';
import 'package:codeli/pages/forgot_password/forgot_password_page.dart';
import 'package:codeli/pages/login/login_page_controller.dart';
import 'package:codeli/pages/register/register_page.dart';
import 'package:codeli/shared/utils/schema_validate.dart';
import 'package:flutter/material.dart';
import 'package:codeli/shared/widgets/button_widget/button_widget.dart';
import 'package:codeli/shared/widgets/input_widget/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final controller = LoginPageController();

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
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset(AppImages.logo),
                ),
                Form(
                  key: _formKey,
                  child: Column(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InputWidget(
                          placeholder: 'E-mail',
                          type: TextInputType.emailAddress,
                          controller: controller.email,
                          validator: (value) => validateEmail(value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InputWidget(
                          placeholder: 'Senha',
                          type: TextInputType.visiblePassword,
                          controller: controller.password,
                          validator: (value) => validatePassword(value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ButtonWidget.primary(
                          label: "Login",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Processing Data"),
                                ),
                              );
                            }
                          },
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
