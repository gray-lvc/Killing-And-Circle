/* === Класс модов === */
/* Здесь происходит генерация способностей,
вещей, еды и все такое. И этот раздел не 
дополнения, для дополнений нужно писать 
свое API, а это тяжело пока. */

class Mods {
  // Поля
  private float x, y;    // Координаты
  private color col;     // Цвет
  private float trans;   // Прозрачность.
  private float speed;   // Скорость
  private float size;    // Размер
  private float xp;      // Количество жизни
  private float damage;  // Урон
  private boolean once;  // Единирозавая генерация, должна быть равна true.
  
  private int onceFoods = -1;  // Переменная для правильной работы функции по лечению игрока
  
  // Конструктор
  // Инициализируем приватные переменные
  Mods (float xTemp, float yTemp, color colTemp, float transTemp, float speedTemp, float sizeTemp, float xpTemp, float dTemp, boolean onceTemp) {
    this.x = xTemp;
    this.y = yTemp;
    this.col = colTemp;
    this.trans = transTemp;
    this.speed = speedTemp;
    this.size = sizeTemp;
    this.xp = xpTemp;
    this.damage = dTemp;
    this.once = onceTemp;
  }
  
  // Метод отображеия
  void display () {

  }
  
  // Метод обновления
  void update () {
    
  }
  
  // Метод для получения рандомных характеристик еды
  void foodsCharacteristics () {
    this.xp = round(random(1.0, 50.0));                              // Получаем рандомное число востановления хп от еды
    // Красим еду в зависимости от востанавливаемых им xp
    if (this.xp <= 10.0)
      this.col = WHITE;
    else if ((this.xp > 10.0) && (this.xp <= 20.0))
      this.col = BROWN;
    else if ((this.xp > 20.0) && (this.xp <= 30.0))
      this.col = GREEN;
    else if ((this.xp > 30.0) && (this.xp <= 40.0))
      this.col = PURPLE;
    else
      this.col = PINK;
  }
  
  // Метод для генерации еды с разными характеристиками в рандомном месте
  void foods () {
    noStroke();                                                      // Без обводки
    fill(this.col, 255*sin(this.trans));                             // Цвет заливки и прозрачность
    ellipse(this.x, this.y, this.size, this.size);                   // Еда
    // Условие выполниться, когда игрок приблизиться к еде
    if (((this.x >= (player.x - this.size)) && (this.x <= (player.x + this.size))) && ((this.y >= (player.y - this.size)) && (this.y <= (player.y + this.size)))) {
      _recoveryHP(this.xp);                                          // Лечим игрока на определенное количество хп
      foodsCharacteristics();                                        // Получаем рандомные характеристики еды
      fill(BLACK);                                                   // Закрашиваем фрукт в цвет фона
      ellipse(this.x, this.y, this.size, this.size);                 // Создаем этот фрукт
      locationRandom();                                              // Даем новые координаты для еды
    }
  }
  
  // Процедура дли рандомной генерации координат
  void locationRandom () {
    this.x = random(width);
    this.y = random(height);
  }
  
}
