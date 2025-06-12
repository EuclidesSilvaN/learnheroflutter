import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3738BC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.grey),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'PUzumaki21',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.diamond, color: Colors.white),
                ],
              ),
            ),

            // XP Progress
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '850/1000',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.85,
                      backgroundColor: Colors.white24,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.greenAccent,
                      ),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Ranking Card
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF1F1FF),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    const Center(
                      child: Text(
                        'RANKING',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildRankingItem(
                      "SkittleBerry",
                      "3000",
                      "diamond",
                      "assets/avatar1.png",
                    ),
                    _buildRankingItem(
                      "BrayanAlexBr",
                      "1500",
                      "star",
                      "assets/avatar2.png",
                    ),
                    _buildRankingItem(
                      "AddisonDark14",
                      "1250",
                      "diamond",
                      "assets/avatar3.png",
                    ),
                    _buildRankingItem(
                      "JeffrryUh23",
                      "1250",
                      "diamond",
                      "assets/avatar4.png",
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

  Widget _buildRankingItem(
    String name,
    String score,
    String badge,
    String avatarAsset,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(avatarAsset)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(score),
        trailing: badge == "diamond"
            ? const Icon(Icons.diamond, color: Colors.blue)
            : const Icon(Icons.star, color: Colors.amber),
        tileColor: const Color(0xFFE2E2FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
