import 'package:codeli/core/core.dart';
import 'package:codeli/pages/forgot_password/forgot_password_page_controller.dart';
import 'package:codeli/pages/login/login_page.dart';
import 'package:codeli/services/auth_service.dart';
import 'package:codeli/shared/utils/schema_validate.dart';
import 'package:codeli/shared/widgets/button_widget/button_widget.dart';
import 'package:codeli/shared/widgets/input_widget/input_widget.dart';
import 'package:codeli/shared/widgets/show_snackbar_widget/show_snackbar_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final controller = ForgotPasswordController();

  final _formKey = GlobalKey<FormState>();

  AuthService authService = AuthService();

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
                Form(
                  key: _formKey,
                  child: Column(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InputWidget(
                            placeholder: 'E-mail',
                            type: TextInputType.emailAddress,
                            controller: controller.email,
                            validator: (value) => validateEmail(value)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 16),
                        child: ButtonWidget.primary(
                          label: "Enviar",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _handleForgotPassword(
                                  email: controller.email.text);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
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

  _handleForgotPassword({required String email}) {
    authService.handleForgotPassword(email: email).then((String? error) {
      if (error == null) {
        showSnackBarWidget(
            context: context,
            message: "E-mail de redefinição enviado!",
            isErro: false);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else {
        showSnackBarWidget(context: context, message: error);
      }
    });
  }
}
