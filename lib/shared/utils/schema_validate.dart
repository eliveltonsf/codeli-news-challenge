String? validateEmail(String? email) {
  RegExp emailRegex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  final isEmailValid = emailRegex.hasMatch(email ?? '');
  if (email == null || email == '') {
    return 'Por favor, insira um endereço de e-mail válido.';
  }
  if (!isEmailValid) {
    return 'O endereço de e-mail fornecido não é válido.\nPor favor, verifique e tente novamente.';
  }
  return null;
}

String? validatePassword(String? pasword) {
  RegExp passwordRegex = RegExp(
      r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])[0-9a-zA-Z$*&@#]{8,}$');
  final isPasswordValid = passwordRegex.hasMatch(pasword ?? '');
  if (pasword == null || pasword == '') {
    return 'Por favor, insira uma senha válida.';
  }
  if (!isPasswordValid) {
    return 'Senha deve conter:\n- No minimo 8 caracteres.\n- Ao menos uma letra minúscula.\n- Ao menos uma letra maiúscula.\n- Ao menos um caractere especial (!, @, #, etc.).\n- Ao menos um número';
  }
  return null;
}

String? validateUsername(String? name) {
  RegExp nameRegex = RegExp(r'^[a-zA-Z]\S{3,}$');
  final isNameValid = nameRegex.hasMatch(name ?? '');
  if (name == null || name == '') {
    return 'Por favor, insira um nome de usuário válido.';
  }
  if (!isNameValid) {
    return 'O nome de usuário deve ter no mínimo 4 caracteres,\ncomeçar com uma letra e não pode conter espaços.';
  }
  return null;
}
