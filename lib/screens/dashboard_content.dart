import 'package:flutter/material.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> players = [
      {'name': 'SkittleBerry', 'avatar': 'avatar1.png', 'points': 3000},
      {'name': 'BrayanAlexBr', 'avatar': 'avatar2.png', 'points': 1500},
      {'name': 'AdilsonDark14', 'avatar': 'avatar3.png', 'points': 1250},
      {'name': 'JeffreyUch23', 'avatar': 'avatar4.png', 'points': 1250},
    ];

    // Ordenação dos jogadores por pontos (do maior para o menor)
    players.sort((a, b) => (b['points'] as int).compareTo(a['points'] as int));

    return Scaffold(
      backgroundColor: const Color(0xFF3738BC),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),

            // Header com avatar, nome e medalha (PUzumaki21)
            // Layout ajustado para: avatar à esquerda, nome no centro, medalha à direita
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0), // Adiciona espaçamento lateral
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribui os filhos uniformemente no espaço
                children: [
                  // Avatar do PUzumaki21
                  CircleAvatar(
                    radius: 30, // Tamanho do avatar principal
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  // Nome do PUzumaki21
                  const Text(
                    'PUzumaki21',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Medalha do PUzumaki21 (Prata, conforme sua última instrução)
                  Image.asset('assets/images/prata.png', width: 50, height: 50),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // XP Bar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF6C63FF),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 200,
                    height: 16,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      '850/1000',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Ranking título
            const Text(
              'RANKING',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Lista de jogadores dinâmica
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    final player = players[index];
                    return _buildPlayerCard(
                      player['name'] as String, // Passa o nome para determinar a medalha
                      'assets/images/${player['avatar']}',
                      player['points'] as int,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para retornar imagem da medalha baseada no nome do jogador
  String getMedalImageByName(String playerName) {
    debugPrint("Nome do jogador recebido para medalha: $playerName");
    switch (playerName) {
      case 'SkittleBerry':
        return 'assets/images/diamant.png'; // SkittleBerry é diamante
      case 'BrayanAlexBr':
        return 'assets/images/ouro.png'; // BrayanAlexBr é ouro
      case 'AdilsonDark14':
      case 'JeffreyUch23': // Ambos Adilson e Jeffrey são prata
        return 'assets/images/prata.png';
      default: // Para qualquer outro jogador que não esteja listado explicitamente
        return 'assets/images/prata.png'; // Medalha padrão
    }
  }

  // Widget do card de jogador com imagem de medalha
  Widget _buildPlayerCard(
    String name,
    String avatarPath,
    int points,
  ) {
    final medalImage = getMedalImageByName(name); // Obtém a medalha pelo nome

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 24, backgroundImage: AssetImage(avatarPath)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Text('$points', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Image.asset(medalImage, width: 28, height: 28),
        ],
      ),
    );
  }
}