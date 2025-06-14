import 'package:flutter/material.dart';
import '../models/user_data.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthController = TextEditingController();
  final _phoneController = TextEditingController();

  void _register() {
    // Simula cadastro: define nome global e vai pra home
    UserData.setUsername(_nameController.text);
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _goToLogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3738BC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                const Text(
                  'CADASTRE-SE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 24),

                // Nome de usuário
                _buildTextField(_nameController, 'Nome de Usuário'),
                const SizedBox(height: 12),

                // Email
                _buildTextField(_emailController, 'E-mail'),
                const SizedBox(height: 12),

                // Senha
                _buildTextField(_passwordController, 'Criar senha', obscure: true),
                const SizedBox(height: 12),

                // Data de nascimento
                _buildTextField(_birthController, 'Data de nascimento'),
                const SizedBox(height: 12),

                // Celular
                _buildTextField(_phoneController, 'Celular (opcional)'),
                const SizedBox(height: 16),

                // Botão de login com Google (simulado)
                ElevatedButton.icon(
                  onPressed: () {
                    // Simula vínculo com conta Google
                  },
                  icon: Image.asset('assets/images/google.png', height: 24),
                  label: const Text('Vincular a conta do Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                ),

                const SizedBox(height: 24),

                // Botão confirmar (laranja)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF9900),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'CONFIRMAR',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Center(
                  child: TextButton(
                    onPressed: _goToLogin,
                    child: const Text(
                      'Já tem uma conta? Entrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      {bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
