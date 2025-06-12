import 'package:flutter/material.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3738BC),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),

            // Header com avatar, nome e medalha
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'PUzumaki21',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                const Icon(Icons.diamond, color: Colors.white, size: 28),
              ],
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

            // Lista de jogadores
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: ListView(
                  children: [
                    _buildPlayerCard(
                      'SkittleBerry',
                      'assets/images/avatar1.png',
                      3000,
                      Icons.diamond,
                    ),
                    _buildPlayerCard(
                      'BrayanAlexBr',
                      'assets/images/avatar2.png',
                      1500,
                      Icons.star,
                    ),
                    _buildPlayerCard(
                      'AdilsonDark14',
                      'assets/images/avatar3.png',
                      1250,
                      Icons.diamond,
                    ),
                    _buildPlayerCard(
                      'JeffreyUch23',
                      'assets/images/avatar4.png',
                      1250,
                      Icons.diamond,
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

  Widget _buildPlayerCard(
    String name,
    String avatar,
    int points,
    IconData medal,
  ) {
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
          CircleAvatar(radius: 24, backgroundImage: AssetImage(avatar)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Text('$points', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Icon(medal, size: 24),
        ],
      ),
    );
  }
}
