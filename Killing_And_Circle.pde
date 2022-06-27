// Объявление констант
final color WHITE = #FFFFFF;         // Белый цвет
final color RED = #FF0000;           // Крассный цвет
final color BLUE = #000EFF;          // Синий цвет
final color BLACK = #000000;         // Черный цвет
final color PINK = #FF3399;          // Розовый цвет  
final color BROWN = #996633;         // Коричневый цвет
final color PURPLE = #6633CC;        // Фиолетовый цвет
final color GREEN = #33FF66;         // Зеленый цвет

// Объявлени объектов
Player player = new Player(width/2, height/2, WHITE, 1.0, 5.5, 20, 100, 10);            // Создание игрока
Enemy enemy = new Enemy(random(1000), random(1000), RED, 1.0, 1.5, 20, 10, 1);          // Создание игрока
Menu menu = new Menu();
Mods mods = new Mods (random(width), random(height), BLUE, 1.0, 10, 20, 1, 0, false);

int gameScene = 0;   // Переменная для переключения между сценами 

/********* SETUP BLOCK *********/

void setup () {
  size(1280, 720);   // Устанавливаем размер игрового окна
  //fullScreen();
}

/********* DRAW BLOCK *********/

void draw () {
  if (gameScene == 0) {
    initScene();
  } else if (gameScene == 1) {
    gameScene();
  } else if (gameScene == 2) {
    gameOverScene();
  }
}


/********* SCENE CONTENTS *********/

// Процедура инициализирует первую сцену
void initScene () {
  background(BLACK);
  menu.textStart();
  mods.foodsCharacteristics();                       // Метод для получения рандомных характеристик еды
}

// Игровая сцена
void gameScene () {
  background(BLACK);                                 // Цвет фона
  
  menu.textXP();                                     // Отображаем строчку с количеством хп игрока
  menu.textDamage();                                 // Отображаем строчку с количеством урона игрока
  
  player.display();                                  // Отображаем игрока
  player.update();                                   // Обновляем игрока
  
  enemy.display();                                   // Отображаем врага
  enemy.update();                                    // Обновляем врага
  
  mods.foods();                                      // Генирируем и отображаем рандомный фрукт
}

// Процедура показывает сцену конца игры, обычно при смерти
void gameOverScene () {
  background(BLACK);
  menu.textGameOver();
}


/********* INPUTS *********/

public void mousePressed () {
  // Eсли мы находимся на начальной Сцене при клике, запускаем игру
  if (gameScene == 0) {
    gameScene = 1;
  } else if (gameScene == 2) {
    gameScene = 0;
    player.recoveryHP(100.0);
    enemy.movingEnemy();
  } else {}
}

/********* OTHER FUNCTIONS *********/

// Процедура востанавливает хп игрока
// Вызывает метод востаналения ха у игрока
void _recoveryHP (float xpTemp) {
  if (player.xp <= 90.0)
    player.recoveryHP(xpTemp);
}
