# 📚 LearnHero

Um aplicativo educacional gamificado feito com **Flutter**, inspirado por super-heróis do conhecimento!
Desenvolvido com foco em **UI/UX** fiel ao protótipo no **Figma**.

## 🎯 Objetivo

Criar um aplicativo funcional e interativo baseado no protótipo desenvolvido durante o 1º bimestre.
A proposta é incentivar o aprendizado com quizzes, missões e evolução de nível.

## 🖼️ Protótipo no Figma

🔗 [Acessar Protótipo]([https://www.figma.com/...](https://www.figma.com/design/KVcYByeOXxQZMkFXuqYIgH/Trabalho-UX-e-UI-LearnHero?node-id=8-25&t=DXDojQjS5GmRRNmd-1))  

## 📱 Funcionalidades Implementadas

* ✅ **Tela de Login** e **Cadastro** com layout personalizado.
* ✅ Cadastro com campos adicionais: nome, nascimento, celular, Google (simulado).
* ✅ **Quiz interativo** com:
    * Múltiplas perguntas
    * Contagem de acertos
    * Sistema de XP
* ✅ **Dashboard** (Tela Inicial/Ranking) com:
    * Barra de progresso de XP
    * Nível do jogador
    * Avatar personalizado
    * **Ranking dinâmico** com medalhas (Ouro, Prata, Diamante) e XP.
    * Layout de cabeçalho ajustado para avatar à esquerda, nome centralizado e medalha à direita.
* ✅ **Tela de Perfil** com:
    * Estatísticas do usuário (Nível, XP)
    * Histórico de missões completadas
    * **Medalha de Prata** personalizada para o usuário (PUzumaki21)
    * Botões de compartilhamento (Facebook) e Logout.
* ✅ **Tela de Missões** (estrutura básica implementada, pronta para expansão).

## 🧪 Tecnologias

* **Flutter 3.x**
* Navegação com `Navigator`
* Layout responsivo com `SafeArea`, `Expanded`, `SizedBox`, etc.
* Assets locais (imagens, ícones)
* Estilo e componentes consistentes com base no Figma

## 🧩 Estrutura do Projeto

lib/
├── models/
│   └── user_data.dart        # Armazena dados simulados do usuário
├── screens/
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── quiz_screen.dart
│   ├── profile_screen.dart
│   ├── dashboard_content.dart  # Tela principal com ranking
│   └── missions_content.dart   # Tela de Missões
├── main.dart                 # Ponto de entrada do app e navegação principal
assets/
├── images/                   # Avatares, mascotes, ícones das medalhas, etc.


## 🚀 Como rodar o projeto

### Pré-requisitos
* [Flutter SDK instalado](https://flutter.dev/docs/get-started/install)
* Android Studio ou VSCode com o plugin Flutter
* Emulador ou dispositivo físico conectado

### Passos
1.  Clone o repositório:
    ```bash
    git clone [https://github.com/EuclidesSilvaN/learnheroflutter.git](https://github.com/EuclidesSilvaN/learnheroflutter.git)
    ```
2.  Navegue até o diretório do projeto:
    ```bash
    cd learnheroflutter
    ```
3.  Obtenha as dependências:
    ```bash
    flutter pub get
    ```
4.  Execute o aplicativo:
    ```bash
    flutter run
    ```

## 👨‍💻 Autores

* **Euclides Silva Neto** ([github.com/EuclidesSilvaN](https://github.com/EuclidesSilvaN))
* **Adriel Guss dos Santos** ([github.com/AdrielGuss](https://github.com/AdrielGuss))

## 📽️ Apresentação (vídeo)

📌 Link para vídeo de demonstração:  


## 📌 Status

✔️ Projeto concluído para entrega da 2ª etapa da disciplina de UX e UI
🎓 **Faculdade:** UniSales - Centro Universitário Salesiano
