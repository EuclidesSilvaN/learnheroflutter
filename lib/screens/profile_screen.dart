import 'package:flutter/material.dart';
import '../models/user_data.dart'; // Certifique-se de que este caminho está correto

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3738BC),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os filhos na horizontal
          children: [
            const SizedBox(height: 24),

            // Avatar + Nome
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            const SizedBox(height: 8),
            Text(
              UserData.username,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            // Medalha - AGORA É IMAGEM DA MEDALHA PRATA
            Image.asset(
              'assets/images/prata.png', // Caminho para a imagem da medalha prata
              width: 50, // Ajuste o tamanho conforme necessário
              height: 50, // Ajuste o tamanho conforme necessário
            ),
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
                    _buildStatBox('Level ${UserData.level}'),
                    const SizedBox(height: 8),
                    _buildStatBox('${UserData.xp} XP'),

                    const SizedBox(height: 24),

                    const Text(
                      'Histórico de Missões',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),

                    _buildMissionItem('Descubra a Ciência'),
                    const SizedBox(height: 8),
                    _buildMissionItem('Desafio de Matemática'),
                    const SizedBox(height: 8),
                    _buildMissionItem('Aprenda a História'),

                    const Spacer(),

                    // Facebook + Logout
                    Center(
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.facebook, color: Colors.blue),
                            onPressed: () {
                              // ação futura de compartilhamento
                            },
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            icon: const Icon(Icons.logout),
                            label: const Text("Sair"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
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
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMissionItem(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}