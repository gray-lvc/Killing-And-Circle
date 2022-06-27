/* === Класс враг === */
class Enemy {
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
  Enemy (float xTemp, float yTemp, color colTemp, float transTemp, float speedTemp, float sizeTemp, float xpTemp, float dTemp) {
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
    noStroke();                              // Без обводки
    fill(col, 255*sin(trans));               // Цвет заливки и прозрачность
    ellipse(this.x, this.y, size, size);     // Враг
  }
  
  // Метод обновления
  void update () {
    tracking();   // Следим за игроком
    damage();     // Функция, котораяя наносит урон игроку
  }
  
  // Метод слежения врага за игроком
  void tracking () {
    if (this.x < player.x)
      this.x += speed;
    if (this.x > player.x)
      this.x -= speed;
    if (this.y < player.y)
      this.y += speed;
    if (this.y > player.y)
      this.y -= speed;
  }
  
  // Метод, котораяя наносит урон игроку
  void damage () {
    if (((this.x >= (player.x - this.size / 2)) && (this.x <= (player.x + this.size / 2))) && ((this.y >= (player.y - this.size / 2)) && (this.y <= (player.y + this.size / 2)))) {
        player.dealDamage(this.damage);   // Метод наносит урон игроку;
      }
  }
  
  // Метод рандомного спавна врага
  void movingEnemy() {
    this.x = random(1000);
    this.x = random(1000);
  };
}
