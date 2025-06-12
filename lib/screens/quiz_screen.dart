import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? selectedAnswer; // seleção atual do aluno (pode mudar)
  final String correctAnswer = 'C';
  bool answered = false; // se já confirmou a resposta

  void selectAnswer(String option) {
    if (!answered) {
      setState(() {
        selectedAnswer = option;
      });
    }
  }

  void confirmAnswer() {
    if (selectedAnswer != null) {
      setState(() {
        answered = true;
      });
    }
  }

  void goToResult() {
    final int score = selectedAnswer == correctAnswer ? 1 : 0;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizResultPage(score: score)),
    );
  }

  Widget answerButton(String option, String text) {
    final bool isSelected = selectedAnswer == option;

    Color bgColor;
    if (answered) {
      if (option == correctAnswer) {
        bgColor = Colors.green;
      } else if (isSelected) {
        bgColor = Colors.red;
      } else {
        bgColor = Colors.grey.shade300;
      }
    } else {
      bgColor = isSelected ? Colors.blue.shade200 : Colors.white;
    }

    return ElevatedButton(
      onPressed: () => selectAnswer(option),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: Colors.black,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("$option. $text"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5B33D1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B33D1),
        foregroundColor: Colors.white,
        title: const Text(
          "QUIZ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Qual é o maior planeta do Sistema Solar?",
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            answerButton('A', 'Marte'),
            const SizedBox(height: 12),
            answerButton('B', 'Vênus'),
            const SizedBox(height: 12),
            answerButton('C', 'Júpiter'),
            const SizedBox(height: 12),
            answerButton('D', 'Saturno'),
            const Spacer(),
            ElevatedButton(
              onPressed: selectedAnswer == null
                  ? null
                  : answered
                  ? goToResult
                  : confirmAnswer,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedAnswer == null
                    ? Colors.grey
                    : Colors.white,
                foregroundColor: selectedAnswer == null
                    ? Colors.black38
                    : Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                answered ? "VER RESULTADO" : "PRÓXIMA PERGUNTA",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class QuizResultPage extends StatelessWidget {
  final int score;

  const QuizResultPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado do Quiz'),
        backgroundColor: const Color(0xFF5B33D1),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sua pontuação final é:',
                style: TextStyle(fontSize: 24, color: Colors.grey.shade800),
              ),
              const SizedBox(height: 20),
              Text(
                '$score / 1',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5B33D1),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B33D1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Voltar', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
