class UserData {
  static int xp = 850; // XP inicial
  static int level = 3;
  static String username = 'PUzumaki21'; // Nome de usuário inicial

  static void addXP(int value) {
    xp += value;
    while (xp >= 1000) {
      xp -= 1000;
      level++;
    }
  }

  static void setUsername(String newName) {
    username = newName;
  }
}
