import 'package:codeli/core/core.dart';
import 'package:codeli/pages/register/register_page_controller.dart';
import 'package:codeli/services/auth_service.dart';
import 'package:codeli/shared/utils/schema_validate.dart';
import 'package:codeli/shared/widgets/button_widget/button_widget.dart';
import 'package:codeli/shared/widgets/input_widget/input_widget.dart';
import 'package:codeli/shared/widgets/show_snackbar_widget/show_snackbar_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = RegisterPageController();
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
              image: AssetImage(AppImages.register), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: const BoxDecoration(gradient: AppGradients.linear),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Novo cadastro",
                            style: AppTextStyles.heading30Primary,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: InputWidget(
                              placeholder: 'Nome de usuário',
                              type: TextInputType.text,
                              controller: controller.username,
                              validator: (value) => validateUsername(value),
                            ),
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
                                validator: (value) => validatePassword(value)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: InputWidget(
                              placeholder: 'Confirmar Senha',
                              type: TextInputType.visiblePassword,
                              controller: controller.confirmPassword,
                              validator: (value) {
                                if (value != controller.password.text) {
                                  return 'Senha não confere';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 16),
                            child: ButtonWidget.primary(
                              label: "Cadastrar",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _handleRegisterUser(
                                    email: controller.email.text,
                                    password: controller.password.text,
                                    username: controller.username.text,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _handleRegisterUser({
    required String email,
    required String password,
    required String username,
  }) {
    authService
        .handleRegisterUser(
      email: email,
      password: password,
      username: username,
    )
        .then((String? error) {
      if (error == null) {
        showSnackBarWidget(
          context: context,
          message: 'Cadastrado efetuado!',
          isErro: false,
        );
      } else {
        showSnackBarWidget(
          context: context,
          message: error,
        );
      }
    });
  }
}
