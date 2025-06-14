import 'package:flutter/material.dart';
import '../models/user_data.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int xp = 0;
  String? selectedAnswer;
  bool answered = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Qual é o maior planeta do Sistema Solar?",
      "options": {
        "A": "Marte",
        "B": "Vênus",
        "C": "Júpiter",
        "D": "Saturno",
      },
      "correct": "C"
    },
    {
      "question": "Qual é o órgão responsável por bombear sangue no corpo humano?",
      "options": {
        "A": "Fígado",
        "B": "Pulmão",
        "C": "Estômago",
        "D": "Coração",
      },
      "correct": "D"
    },
    {
      "question": "Qual elemento químico tem o símbolo O?",
      "options": {
        "A": "Ouro",
        "B": "Osmônio",
        "C": "Oxigênio",
        "D": "Ozônio",
      },
      "correct": "C"
    },
    {
      "question": "Em qual sistema do corpo humano os neurônios atuam?",
      "options": {
        "A": "Digestório",
        "B": "Respiratório",
        "C": "Circulatório",
        "D": "Nervoso"
      },
      "correct": "D"
    },
    {
      "question": "Qual desses processos é responsável pela fotossíntese nas plantas?",
      "options": {
        "A": "Clorofila absorvendo luz solar",
        "B": "Raízes absorvendo oxigênio",
        "C": "Flores produzindo sementes",
        "D": "Água sendo evaporada pelas folhas"
      },
      "correct": "A"
    },
  ];

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
        final correct = questions[currentQuestionIndex]['correct'];
        if (selectedAnswer == correct) {
          score++;
          xp += 200;
        }
      });
    }
  }

  void nextQuestionOrFinish() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      UserData.addXP(xp);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultPage(score: score, xp: xp),
        ),
      );
    }
  }

  Widget answerButton(String option, String text) {
    bool isSelected = selectedAnswer == option;
    String correct = questions[currentQuestionIndex]['correct'];
    Color bgColor;

    if (answered) {
      if (option == correct) {
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
    final question = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF5B33D1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B33D1),
        foregroundColor: Colors.white,
        title: const Text("QUIZ", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              question["question"],
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ...question['options'].entries.map<Widget>((entry) {
              return Column(
                children: [
                  answerButton(entry.key, entry.value),
                  const SizedBox(height: 12),
                ],
              );
            }),
            const Spacer(),
            ElevatedButton(
              onPressed: selectedAnswer == null
                  ? null
                  : answered
                      ? nextQuestionOrFinish
                      : confirmAnswer,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedAnswer == null ? Colors.grey : Colors.white,
                foregroundColor: selectedAnswer == null ? Colors.black38 : Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                answered ? "PRÓXIMA PERGUNTA" : "CONFIRMAR",
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
  final int xp;

  const QuizResultPage({super.key, required this.score, required this.xp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Resultado do Quiz'),
        backgroundColor: const Color(0xFF5B33D1),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Parabéns!', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text('Você acertou $score de 5 perguntas.', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 12),
              Text('XP ganho: $xp', style: const TextStyle(fontSize: 20, color: Colors.green)),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B33D1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
