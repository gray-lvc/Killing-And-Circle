/* === Класс меню === */

class Menu {

  // Отображает количество ХП на экране
  void textXP () {
    textAlign(LEFT);
    textSize(24);
    fill(WHITE);
    text("XP: " + player.xp, 25, 40);
  }

  // Отображает количество урона на экране
  void textDamage () {
    textAlign(LEFT);
    textSize(24);
    fill(WHITE);
    text("Damage: " + player.damage, 25, 80);
  }
  
  // Отображает текст конца игры
  void textGameOver () {
    textAlign(CENTER);
    textSize(54);
    fill(RED);
    text("GAME OVER", width/2, height/2);
  }
  
   // Отображает текстовый запрос начать игру
  void textStart () {
    textAlign(CENTER);
    textSize(54);
    fill(WHITE);
    text("Click to start", width/2, height/2);
  }

}
