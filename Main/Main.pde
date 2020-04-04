color COLOR_DEFAULT = color(214);
color COLOR_ACTIVE = color(255, 106, 0);
color COLOR_SUCCESS = color(51, 159, 255);
color BACKGROUND = COLOR_DEFAULT;

int MIN_SECONDS = 2;
int MAX_SECONDS = 3;

boolean CLICKED_SPACE = false;
boolean CLICKED_A = false;

Mode MODE = Mode.BEFORE_GAME;

GameInformation information = new GameInformation();
Scoreboard scoreboard = new Scoreboard();
Game game = new Game();


void setup() {
   size(600, 400);
}
 
void draw() {
  
  // Refresh background
  background(BACKGROUND);
  
  // Display game information
  information.update(MODE);
  
  // Refresh scoreboard
  scoreboard.draw();
  
  // Watch user's interaction
  game.watch();
   
}

 
void keyPressed() {
  
  switch (keyCode) {
   
    case 32:                  // keycode for spacebar
      CLICKED_SPACE = true;    
      break;
     
    case 65:                  // includes both 'a' and 'A' in one statement
      CLICKED_A = true;
      break;
  }  
  
}
