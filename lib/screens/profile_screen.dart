import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3738BC),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Botão Voltar
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const SizedBox(height: 8),

            // Avatar + Nome
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                'assets/images/avatar.png',
              ), // coloque seu avatar
            ),
            const SizedBox(height: 8),
            const Text(
              'PUzumaki21',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            // Medalha
            const Icon(Icons.diamond, color: Colors.white70),
            const Text(
              'PRATA',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Container branco com estatísticas
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Estatísticas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildStatBox('Level 3'),
                    const SizedBox(height: 8),
                    _buildStatBox('850 XP'),

                    const SizedBox(height: 20),

                    const Text(
                      'Histórico de Missões',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildStatBox('Descubra a Ciência'),
                    _buildStatBox('Desafio de Matemática'),
                    _buildStatBox('Aprenda a História'),

                    const Spacer(),

                    // Botão (simulando logout ou compartilhamento)
                    Center(
                      child: IconButton(
                        icon: const Icon(Icons.facebook, color: Colors.blue),
                        onPressed: () {
                          // ação de compartilhamento ou vinculação futura
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
