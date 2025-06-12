import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class MissionsScreen extends StatefulWidget {
  const MissionsScreen({super.key});

  @override
  State<MissionsScreen> createState() => _MissionsScreenState();
}

class _MissionsScreenState extends State<MissionsScreen> {
  String? selectedMission;

  void handleMissionTap(String mission) {
    if (mission == 'Descubra a Ciência') {
      setState(() {
        selectedMission = mission;
      });
    }
  }

  void startMission() {
    if (selectedMission == 'Descubra a Ciência') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QuizScreen()),
      );
    }
  }

  Widget buildMissionTile(
    String title,
    String duration,
    Color color,
    IconData icon,
  ) {
    bool isEnabled = title == 'Descubra a Ciência';
    bool isSelected = selectedMission == title;

    return GestureDetector(
      onTap: isEnabled ? () => handleMissionTap(title) : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.lightGreen.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Dificuldade",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Text(duration),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MISSÕES",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF5B33D1),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          buildMissionTile(
            "Desafio de Matemática",
            "5 min",
            Colors.orange,
            Icons.calculate,
          ),
          buildMissionTile(
            "Descubra a Ciência",
            "10 min",
            Colors.green,
            Icons.science,
          ),
          buildMissionTile(
            "Aprenda a História",
            "15 min",
            Colors.red,
            Icons.account_balance,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              onPressed: selectedMission == 'Descubra a Ciência'
                  ? startMission
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "INICIAR MISSÃO",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
