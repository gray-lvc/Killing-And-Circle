/* === Класс игрок === */
class Player {
  // Поля
  private float x, y;    // Координаты
  private color col;     // Цвет
  private float trans;   // Прозрачность.
  private float speed;   // Скорость
  private float size;    // Размер
  private float xp;      // Количество жизни
  private float damage;  // Урон
  
  // Конструктор
  // Инициализируем приватные переменные
  Player (float xTemp, float yTemp, color colTemp, float transTemp, float speedTemp, float sizeTemp, float xpTemp, float dTemp) {
    this.x = xTemp;
    this.y = yTemp;
    this.col = colTemp;
    this.trans = transTemp;
    this.speed = speedTemp;
    this.size = sizeTemp;
    this.xp = xpTemp;
    this.damage = dTemp;
  }
  
  // Метод отображеия
  void display () {
    noStroke();                    // Без обводки
    fill(col, 255*sin(trans));     // Цвет заливки и прозрачность
    ellipse(x, y, size, size);     // Игрок
  }
  
  // Метод обновления
  void update () {
    management();
    health();
  }
  
  // Метод для управление персонажем
  void management() {
    if (keyPressed) { // Проверяем нажатую кнопку
      if (key == 'w' || key == 'W' || key == 'Ц' || key == 'ц') // Движение вперед
        if (y < size/2) {} else this.y -= speed;
      if (key == 's' || key == 'S' || key == 'Ы' || key == 'ы') // Движение назад
        if (y > height-size/2) {} else this.y += speed;
      if (key == 'd' || key == 'D' || key == 'в' || key == 'В') // Движкемк вправо
        if (x > width-size/2) {} else  this.x += speed;
      if (key == 'a' || key == 'A' || key == 'Ф' || key == 'ф') // Движкемк влево
        if (x < size/2) {} else this.x -= speed;
    }
  }
  
  // Метод проверки здоровья персонажа
  void health () {
    if (this.xp <= 0) {
      gameScene = 2;
    }
  }
  
  // Метод наносит урон игроку
  void dealDamage (float dd) {
    this.xp -= dd;
  }
  
  // Метод востанавливает хп игрока
  void recoveryHP (float xpTemp) {
    this.xp += xpTemp;
  }
  
}
